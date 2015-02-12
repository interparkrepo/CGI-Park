#-------------------------------------------------------------------------------
#	システムの基本設定ファイルです。
#-------------------------------------------------------------------------------


#■■■ ログファイルの拡張子 ■■■
#ログファイルの保存フォルダをWEB公開領域（ブラウザからアクセスすることが出来るフォ
#ルダ）に置く場合は拡張子を必ず「cgi」等の実行形式の拡張子に変更してください。
#「log」のままにしておくと、ブラウザから直接ログファイルにアクセスされた際、ログ
#ファイルの中身が表示されてしまい、大切な個人情報等が漏洩してしまう可能性がありま
#す。

	$log_ext = 'log';


#■■■ クッキーネーム ■■■
#管理画面のログイン用クッキーの保存名です。
#通常は変更する必要はありません
#当社製品を複数で利用する場合は、すべての商品で同一のクッキーネームを設定してくだ
#さい。

	$cookie_name = 'meijin';


#■■■ ログイン履歴表示件数 ■■■
#管理画面のログイン履歴表示の際に1ページに表示するログの件数を指定してください。

	$alog_scale = '40';


#■■■ admin.cgiまでのフルパス ■■■
#試用期間の開始やライセンスの登録がうまくいかない場合に設定を行ないます。
#主にSSL領域に本CGIを設置した場合に設定が必要になります。
#設定を行う場合は、http://またはhttps://から始まるadmin.cgiまでのパスを指定してください。
# 例）　$admin_cgi_path = 'https://www.cgi-park.com/cgi-bin/cgi/admin.cgi';

	$admin_cgi_path = '';


#-------------------------------------------------------------------------------
#	これ以降は設定を変更する必要はありません。
#	設定を変更すると正しく動作し無くなる可能性があります。
#-------------------------------------------------------------------------------
($CoLogDir) || ($CoLogDir = $LogDir);

###---------------------------------
###　　ファイル変数（変更不要）
###---------------------------------
### 環境設定
$conf_log = "$LogDir/conf.$log_ext";
$conf_db = "$DataDir/conf.db";

### アカウント情報
$account_log = "$CoLogDir/account.$log_ext";
$account_db = "$DataDir/account.db";

### ログイン記録情報
$login_log = "$CoLogDir/login.$log_ext";
$login_db = "$DataDir/login.db";

### メニュー情報
$menu_dat = "$LogDir/menu.$log_ext";

### 基本HTMLファイル
$main_html = "$HtmlDir/main.htm";


### ログファイル
$log_file = "$LogDir/log.$log_ext";
$log_db = "$DataDir/log.db";

### テンプレートデータ
$temp_log = "$LogDir/template.$log_ext";
$temp_db = "$DataDir/template.db";
$form_set_db = "$DataDir/form_set.db";

### カテゴリ情報
$category_log = "$LogDir/category.$log_ext";

### カウントデータ
$count_log = "$LogDir/count.$log_ext";
$count_db = "$DataDir/count.db";


###---------------------------------
###　　システム基本情報
###---------------------------------
### ローカル
$lh = '127.0.0.1,localhost';
### 暗号Key
$crypt_key = 'ys';
### 時間変数
$time = time;

open(FILE, "$LogDir/meijin.$log_ext");
flock(FILE, 1);
my @buf = <FILE>;
close(FILE);
($fckey,$apa,$mjnm,$fud,$lud,$cphp,$cpem) = split(/\t/,@buf[0]);
($lc1,$lc2,$lc3,$lc4,$lc5) = split(/\0/,@buf[1]);


###---------------------------------
###　　HTML変数
###---------------------------------
sub html_conf {
	### 表示用基礎HTML
	$tmp_base_html = "$ItemDir/temp-base.htm";

	### 全一覧表示用HTMLファイル
	$tmp_list_html = "$ItemDir/temp-list.htm";

	### 検索表示用HTMLファイル
	$tmp_search_html = "$ItemDir/temp-search.htm";

	### カテゴリ一覧表示用HTMLファイル
	$tmp_cate_html = "$ItemDir/temp-cate.htm";

	### トップページ吐き出し素材
	$tmp_top_html = "$ItemDir/temp-top.htm";

	### メニューHTMLファイル
	$tmp_menu_html = "$ItemDir/temp-menu.htm";

	### カウンター用IMGタグ
	$count_tag = qq|<BR><IMG src="index.cgi?cnt=#serial#" width="1" height="1" border="0">|;
}


sub setup_conf {
	$system_log = "$LogDir/system.$log_ext";
	$meijin_log = "$LogDir/meijin.$log_ext";
	$up_record_log = "$LogDir/up_record.$log_ext";
	$up_record_db = "$DataDir/up_record.db";
	
	$DIR{''} = '..';
	$DIR{'cgi'} = '.';
	$DIR{'lib'} = $LibDir;
	$DIR{'data'} = $DataDir;
	$DIR{'log'} = $LogDir;
	$DIR{'html'} = $HtmlDir;
	$DIR{'image'} = $ImageDir;
	$DIR{'item'} = $ItemDir;
}

1;
