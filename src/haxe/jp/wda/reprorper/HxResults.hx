package jp.wda.reprorper;

import jp.wda.reprorper.model.MessageDto;

/**
 * ...
 * 
 * @author amnz
 */
enum HxResults {

	none;
	
	error;
	
	
	messages(list:Array<MessageDto>);
	
	
	log(data:MessageDto);
	
	
	success;

}