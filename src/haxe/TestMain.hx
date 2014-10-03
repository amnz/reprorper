package ;

import haxe.Http;
import jp.wda.reprorper.HxActions;
import jp.wda.reprorper.HxResults;
import jp.wda.reprorper.model.MessageDto;
import jp.wda.reprorper.model.MessageLabelDto;
import jQuery.*;
import js.Lib;

import wdacommons.SerializerTools;

/**
 * ...
 * 
 * @using jQueryExtern 
 * haxelib install jQueryExtern
 * 
 * @author amnz
 */
class TestMain {
	static inline function _( str:String ):JQuery { return untyped $( str ); }

	// アプリケーションエントリーポイント ///////////////////////////////////////////////
	//                                                         Application Entry Point //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 
	 */
	static function main() {
		new JQuery(function():Void { new TestMain(); });
	}

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 
	 */
	public function new() {
		_("#btnGetLabels").click(this.onBtnGetLabels);
		_("#btnLabelsByTime").click(this.onBtnLabelsByTime);
		
		_("#btnWrite").click(onWrite);
		_("#btnGetLog").click(onGetLog);
	}
	
	/**
	 * 
	 * @param	event
	 */
	private function onBtnGetLabels(event:Dynamic):Void {
		var page:Int = Std.parseInt(_("#txtPage").val());
		var amount:Int = Std.parseInt(_("#txtAmount").val());
		send(HxActions.labels(page, amount));
	}
	private function onBtnLabelsByTime(event:Dynamic):Void {
		var from:Date = Date.fromString(_("#txtFrom").val());
		var to:Date   = Date.fromString(_("#txtTo").val());
		Lib.alert("from. " + from);
		
		send(HxActions.labelsByTime(from.getTime(), to.getTime()));
	}
	private function onWrite(event:Dynamic):Void {
		send(HxActions.write(_("#txtLabel").val(), _("#txtMessage").val()));
	}
	private function onGetLog(event:Dynamic):Void {
		var id:Int = Std.parseInt(_("#txtId").val());
		send(HxActions.getLog(id));
	}
	
	private function send(action:EnumValue):Void {
		var connection = new Http(_("#mainForm").attr("action")).addParameter("q", SerializerTools.serialize(action));
		connection.onError = onError;
		connection.onData  = onResult;
		
		connection.request( false );
	}
	
	private function onError(message:String):Void {
		Lib.alert("connection failure. " + message);
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
		trace("no data.");
	}
	private function success():Void {
		trace("success!");
	}
	private function error():Void {
		Lib.alert("error.");
	}
	private function messages(list):Void {
		
	}
	private function labels(list:Array<MessageLabelDto>):Void {
		for (label in list) {
			trace("data:" + label);
		}
	}
	private function log(data:MessageDto):Void {
		trace("label:" + data.label);
		trace("message:" + data.message);
		trace("registered at:" + data.registeredAt);
	}

}
