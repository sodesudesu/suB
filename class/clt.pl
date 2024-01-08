#!/opt/homebrew/opt/perl/bin/perl
use 5.010;
use v5.10;
use strict;
use warnings;
use utf8;
use Tkx;

### メインウィンドウ生成
my $top = Tkx::widget -> new(".");

### テキスト作成のための関数
# ウィンドウバー
sub bar {
  my $text = shift @_;
  $top -> g_wm_title("$text");
}

my $c = $top -> new_canvas(-bg=>"white", -width=>200, -height=>200); # 新キャンバス
$c -> g_pack(-fill=>"both", -expand=>1, -padx => 20, -pady => 20);

# タイトルなど
sub title {
  my $text = shift @_; # 関数の変数
  my $label = $c -> new_label(-text=>"", -font=>["", 100], -justify=>"left", -bg=>"white");
  $label -> g_pack(-anchor=>"c"); # タイトルの表示
  my $label = $c -> new_label(-text=>$text, -font=>["", 100], -justify=>"left", -bg=>"white");
  $label -> g_pack(-anchor=>"c"); # タイトルの表示
}
sub author {
  my $text = shift @_; # 関数の変数
  my $label = $c -> new_label(-text=>"$text　", -font=>["", 50], -justify=>"right", -bg=>"white");
  $label -> g_pack(-anchor=>"e"); # 発表者の表示
}
sub date {
  my $text = shift @_; # 関数の変数
  my $label = $c -> new_label(-text=>"$text　", -font=>["", 50], -justify=>"left", -bg=>"white");
  $label -> g_pack(-anchor=>"e"); # 日付の表示
}

# 見出し
sub head {
  my $text = shift @_;
  my $label = $c -> new_label(-text=>$text, -font=>["", 90], -bg=>"white", -justify=>"left");
  $label -> g_pack(-anchor=>"n");
}

# 本文
sub text {
  my $text = shift @_;
  my $label = $c -> new_label(-text=>$text, -font=>["", 50], -bg=>"white", -justify=>"left");
  $label -> g_pack(-anchor=>"nw");
}

# つぶやき
sub tweet {
  my $text = shift @_;
  my $label = $c -> new_message(-text=>"", -font=>["", 90], -aspect=>700, -bg=>"white");
  $label -> g_pack(-anchor=>"c");
  my $label = $c -> new_label(-text=>$text, -font=>["", 90], -justify=>"left", -bg=>"white");
  $label -> g_pack(-anchor=>"c");

}

# 画像
sub fig {
  my $text = shift @_;
  my $image = Tkx::image_create_photo(-file=>$text);
  $c->new_label(-image => $image)->g_pack;
}


# 矢印キーで進む機能
my @page; # 1ページ分
my $current_word = -1;
my $current_page = 0;
my $counter = 0; # $pageにテキストを格納する用

sub p {
  for (my $i=0; $i<@_; $i++) {
    $page[$counter][$i][0] = $_[$i][0]; # タイプ
    $page[$counter][$i][1] = $_[$i][1]; # 言葉
  }
  $counter++;
}

sub show_page {
  say $page[$current_page][$current_word][1];
  if ($page[$current_page][$current_word][0] eq "h") {
    &head($page[$current_page][$current_word][1]);
  } elsif ($page[$current_page][$current_word][0] eq "t") {
    &text($page[$current_page][$current_word][1]);
  } elsif ($page[$current_page][$current_word][0] eq "title") {
    &title($page[$current_page][$current_word][1]);
  } elsif ($page[$current_page][$current_word][0] eq "author") {
    &author($page[$current_page][$current_word][1]);
  } elsif ($page[$current_page][$current_word][0] eq "date") {
    &date($page[$current_page][$current_word][1]);
  } elsif ($page[$current_page][$current_word][0] eq "tw") {
    &tweet($page[$current_page][$current_word][1]);
  } elsif ($page[$current_page][$current_word][0] eq "f") {
    &fig($page[$current_page][$current_word][1]);
  } elsif ($page[$current_page][$current_word][0] eq undef) {
    &page_reset;
    &next_word;
  }
}

# 改ページ
sub page_reset {
  $c -> g_destroy;
  $c = $top -> new_canvas(-bg=>"white", -width=>200, -height=>200);
  $c -> g_pack(-fill=>"both", -expand=>1, -padx=>20, -pady=>20);
  $current_page++;
  $current_word = -1;
}

# 矢印キーを関数にバインド
$top -> g_bind("<Right>", \&next_word);
$top -> g_bind("<Left>", \&back_word);

# 右矢印キーが押されたときの処理を行う関数
sub next_word {
  $current_word++;
  #show_page();
  if($page[$current_page] ne undef) { # このif文ないとページ最後で無限ループになる
    show_page();
  }
}

# 左矢印が入力されたら、前ページに戻る
sub back_word {
  $c -> g_destroy;
  $c = $top -> new_canvas(-bg=>"white", -width=>200, -height=>200);
  $c -> g_pack(-fill=>"both", -expand=>1, -padx=>20, -pady=>20);
  $current_page = $current_page - 1;
  $current_word = -1;
}

# 箇条書きの点
# \x{2744}

&bar("二項分布の正規近似");

&p(
   ["title", "数学B「統計的な推測」\n第〇回　2項分布の正規近似"],
   ["author","TAIYO"],
   ["date", "2024年1月11日　数学科指導法4の模擬授業"],
  );

&p(
   ["tw", "突然ですが、"]
  );
&p(
   ["tw", "抜き打ちテストをします。"]
  );

&p(
   ["h", "指導案にリンクを貼ってあります"]
  );

&p(
   ["tw", "復習が済んだので、\nここからが本題"]
  );

&p(
   ["tw", "皆さんが気になって仕方ない\nその硬貨で簡単な実験をします。"]
  );

&p(
   ["h", "実験"],
   ["t", "\x{2744} 硬貨を10回投げる\n\x{2744} 表が出た回数esを記録"],
   ["f", "drop.png"],
  );
&p(
   ["tw", "念のため実演します"]
  );

&p(
   ["h", "表と裏の出た回数"],
   ["f", "coin1.png"],
  );

&p(
   ["h", "表の出た回数"],
   ["f", "coin2.png"]
  );

&p(
   ["h", "正規分布を描きたす"],
   ["f", "coin3.png"]
  );

Tkx::MainLoop;
