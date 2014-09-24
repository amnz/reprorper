package jp.wda.reprorper;

/**
 * ...
 * 
 * @author amnz
 */
enum HxActions {

	/**
	 * 直近10件のメッセージ一覧を取得します。
	 */
	list;
	
	/**
	 * ラベル一覧を抽出します。
	 * 
	 * @param page ページ番号 0開始
	 * @param amaount 1ページ当たりの取得件数
	 */
	labels(page:Int, amount:Int);
	
	/**
	 * 指定された時刻間（from以上to未満）のラベル一覧を抽出します。
	 * 
	 * @param from 検索開始日時（msec）
	 * @param to   検索終了日時（msec）
	 */
	labelsByTime(from:Float, to:Float);
	
	/**
	 * 指定されたIDのメッセージを取得します。
	 * 
	 * @param id メッセージID
	 */
	getLog(id:Int);
	
	/**
	 * メッセージを書き込みます
	 * 
	 * @param label メッセージラベル
	 * @param message メッセージ本文
	 */
	write(label:String, message:String);

}
