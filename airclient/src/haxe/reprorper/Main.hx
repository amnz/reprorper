package reprorper;

import flash.Lib;
import flash.display.Sprite;
import haxe.Http;
import jp.wda.reprorper.HxResults;
import jp.wda.reprorper.model.MessageDto;
import jp.wda.reprorper.model.MessageLabelDto;
import wdacommons.SerializerTools;

/**
 * ...
 * @author amnz
 */

class Main extends Sprite {

	// アプリケーションエントリーポイント ///////////////////////////////////////////////
	//                                                         Application Entry Point //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 
	 */
	static function main() {
		Lib.current.addChild(new Main());
	}

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 
	 */
	public function new() {
		super();
		Main.kernel = this;
		
		init_view();
	}
	
	/**
	 * 
	 */
	private function init_view() {
		this.view = new MainView();
		Lib.current.addChild(view);
	}

	// 内部フィールド定義 ///////////////////////////////////////////////////////////////
	//                                                                          Fields //
	/////////////////////////////////////////////////////////////////////////////////////
	
	public static var kernel:Main;
	
	private var view:MainView;

	// イベントハンドラ /////////////////////////////////////////////////////////////////
	//                                                                   Event Handler //
	/////////////////////////////////////////////////////////////////////////////////////
	
	public function send(action:EnumValue):Void {
		var connection = new Http(view.url).addParameter("q", SerializerTools.serialize(action));
		connection.onError = onError;
		connection.onData  = onResult;
		
		connection.request( false );
	}
	
	private function onError(message:String):Void {
		view.log("connection failure. " + message);
	}
	
	private function onResult(data:String):Void {
		var result:HxResults = SerializerTools.unserialize(data);
		switch(result) {
			case HxResults.none :			this.none(); return;
			case HxResults.success :		this.success(); return;
			case HxResults.error :			this.error(); return;
			
			case HxResults.messages(list) :	this.messages(list); return;
			case HxResults.labels(list) :	this.labels(list); return;
			case HxResults.log(data) :		this.log(data); return;
		}
	}
	
	
	private function none():Void {
		view.status("no data.");
	}
	private function success():Void {
		view.status("success!");
	}
	private function error():Void {
		view.status("error.");
	}
	private function messages(list):Void {
		
	}
	private function labels(list:Array<MessageLabelDto>):Void {
		view.status("ラベル一覧取得完了");
		for (label in list) {
			view.log(label.messageId + "\t" + label.registeredAt + "\t" + label.label);
		}
	}
	private function log(data:MessageDto):Void {
		view.status("メッセージ取得完了");
		view.log("label:" + data.label);
		view.log("message:" + data.message);
		view.log("registered at:" + data.registeredAt);
	}

}