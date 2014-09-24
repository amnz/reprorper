package jp.wda.reprorper;

import jp.wda.reprorper.model.MessageDto;
import jp.wda.reprorper.model.MessageLabelDto;

/**
 * ...
 * 
 * @author amnz
 */
enum HxResults {

	none;
	
	error;
	
	
	messages(list:Array<MessageDto>);
	
	
	labels(list:Array<MessageLabelDto>);
	
	
	log(data:MessageDto);
	
	
	success;

}