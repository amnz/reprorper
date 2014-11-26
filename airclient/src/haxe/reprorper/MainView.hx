package reprorper;

import com.bit101.components.InputText;
import com.bit101.components.Label;
import com.bit101.components.Panel;
import com.bit101.components.PushButton;
import com.bit101.components.Style;
import com.bit101.components.TextArea;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.utils.ByteArray;
import jp.wda.reprorper.HxActions;

import flash.display.Sprite;
import flash.events.Event;
import flash.filesystem.File;

/**
 * ...
 * 
 * @author amnz
 */
class MainView extends Sprite {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * ...
	 *
	 */
	public function new() {
		super();
		
		Style.embedFonts = false;
		Style.fontName   = "_ゴシック";
		Style.fontSize   = 13;
		
		if (stage != null) { init(null); } else { addEventListener(Event.ADDED_TO_STAGE, init); }
	}
	
	/**
	 * 
	 * @param	event
	 */
	private function init(event:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		basicInformations = new Panel(this, 5, 5);
		basicInformations.setSize(stage.stageWidth - 10, 50);
		
		new Label(basicInformations, 5, 5,  "reproperサーバ");
		tfServer = new InputText(basicInformations, 100, 5);
		tfServer.width = 300;
		tfServer.text  = Constants.DEFAULT_SERVER;
		
		new Label(basicInformations, 5, 30, "アプリケーションID");
		tfAppID  = new InputText(basicInformations, 100, 30);
		tfAppID.width  = 300;
		tfAppID.text   = Constants.DEFAULT_APP_ID;



		panelGetLogsByPage = new Panel(this, 5, 60);
		panelGetLogsByPage.setSize(stage.stageWidth - 10, 50);
		
		new Label(panelGetLogsByPage, 5, 5,  "ページ");
		tfPage = new InputText(panelGetLogsByPage, 100, 5);
		tfPage.width  = 50;
		tfPage.text   = "0";
		tfPage.restrict = "0123456789";
		
		new Label(panelGetLogsByPage, 5, 30,  "項目数");
		tfAmount = new InputText(panelGetLogsByPage, 100, 30);
		tfAmount.width  = 50;
		tfAmount.text   = "10";
		tfAmount.restrict = "0123456789";
		
		var pb = new PushButton(panelGetLogsByPage, 260, 25, "ラベル一覧取得", getLabels);
		pb.x = stage.stageWidth - 15 - pb.width;



		panelGetLogsByTime = new Panel(this, 5, 115);
		panelGetLogsByTime.setSize(stage.stageWidth - 10, 50);
		
		new Label(panelGetLogsByTime, 255, 5,  "から");
		tfFrom = new InputText(panelGetLogsByTime, 100, 5);
		tfFrom.width  = 150;
		tfFrom.text   = Date.now().toString();
		tfFrom.restrict = "- :0123456789";
		
		new Label(panelGetLogsByTime, 255, 30,  "時間分");
		tfDays = new InputText(panelGetLogsByTime, 200, 30);
		tfDays.width  = 50;
		tfDays.text   = "1";
		tfDays.restrict = "0123456789.";
		
		pb = new PushButton(panelGetLogsByTime, 260, 25, "ラベル一覧取得", getLabelsByTime);
		pb.x = stage.stageWidth - 15 - pb.width;



		panelGetMessage = new Panel(this, 5, 170);
		panelGetMessage.setSize(stage.stageWidth - 10, 50);
		
		new Label(panelGetMessage, 5, 5,  "ID");
		tfMessageID = new InputText(panelGetMessage, 100, 5);
		tfMessageID.width  = 100;
		tfMessageID.text   = "0";
		tfMessageID.restrict = "0123456789";
		
		pb = new PushButton(panelGetMessage, 260, 25, "メッセージ取得", getMessage);
		pb.x = stage.stageWidth - 15 - pb.width;
		
		
		
		statusbar = new Label(this, 5, stage.stageHeight - 5);
		statusbar.y -= statusbar.height;
		
		logger = new TextArea(this, 5, 0);
		logger.setSize(stage.stageWidth - 10, 300);
		logger.y = stage.stageHeight - 5 - logger.height - statusbar.height;
		
		pb = new PushButton(this, 0, 0, "ログ消去", clearLogs);
		pb.x = stage.stageWidth - 5 - pb.width;
		pb.y = logger.y - pb.height - 5;
		
		pb = new PushButton(this, 5, 0, "ログ保存", saveLogs);
		pb.y = logger.y - pb.height - 5;
		
		statusbar.text = "stand by.";
	}

	// 内部フィールド定義 ///////////////////////////////////////////////////////////////
	//                                                                          Fields //
	/////////////////////////////////////////////////////////////////////////////////////

	private var basicInformations:Panel;
	private var tfServer:InputText;
	private var tfAppID:InputText;

	private var panelGetLogsByPage:Panel;
	private var tfPage:InputText;
	private var tfAmount:InputText;

	private var panelGetLogsByTime:Panel;
	private var tfFrom:InputText;
	private var tfDays:InputText;

	private var panelGetMessage:Panel;
	private var tfMessageID:InputText;
	
	private var logger:TextArea;
	private var statusbar:Label;

	// プロパティ ///////////////////////////////////////////////////////////////////////
	//                                                                      Properties //
	/////////////////////////////////////////////////////////////////////////////////////
	
	public var url(get, null):String;
	
	private function get_url():String {
		return tfServer.text + tfAppID.text + Constants.REPRORPER_ACTION;
	}

	// イベントハンドラ /////////////////////////////////////////////////////////////////
	//                                                                   Event Handler //
	/////////////////////////////////////////////////////////////////////////////////////

	private function getLabels(event:Event):Void {
		var page:Null<Int> = Std.parseInt(tfPage.text);
		if (page == null) { page = 0; }
		var amount:Null<Int> = Std.parseInt(tfAmount.text);
		if (amount == null) { amount = 10; }
		
		status("ラベル一覧を取得します...");
		Main.kernel.send(HxActions.labels(page, amount));
	}
	
	private function getLabelsByTime(event:Event):Void {
		var from:Date = Date.fromString(tfFrom.text);
		var days:Null<Float> = Std.parseFloat(tfDays.text);
		if (days == null) {
			days = 1;
			tfDays.text = "1";
		}
		if (days > 24) {
			log("error:取得できるのは24時間分までです。");
			return;
		}
		
		var to:Date   = Date.fromTime(from.getTime() + days*60*60*1000);
		log(from + " - " + to);
		
		status("ラベル一覧を取得します...");
		Main.kernel.send(HxActions.labelsByTime(from.getTime(), to.getTime()));
	}
	
	private function getMessage(event:Event):Void {
		var id:Int = Std.parseInt(tfMessageID.text);
		status("メッセージを取得します...");
		Main.kernel.send(HxActions.getLog(id));
	}
	
	private function clearLogs(event:Event):Void {
		this.logger.text = "";
	}
	
	private function saveLogs(event:Event):Void {
		var file:File = new File();
		file.addEventListener(Event.SELECT, doSave);
		file.browseForSave("ログを保存");
	}
	
	private function doSave(event:Event):Void {
		var byteArr:ByteArray = new ByteArray();
		byteArr.writeMultiByte(this.logger.text, "UTF-8");
		
		var select:File = cast(event.target, File);
		var stream:FileStream = new FileStream();
		stream.open(select, FileMode.WRITE);
		stream.writeBytes(byteArr);
		stream.close();
	}

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////
	
	public function log(message:String):Void {
		this.logger.text = message + "\n" + logger.text;
	}
	
	public function status(message:String):Void {
		this.statusbar.text = message;
	}

}