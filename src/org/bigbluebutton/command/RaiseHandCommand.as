package org.bigbluebutton.command {
	
	import org.bigbluebutton.core.IUsersService;
	import org.bigbluebutton.model.IUserSession;
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class RaiseHandCommand extends Command {
		
		[Inject]
		public var userSession:IUserSession;
		
		[Inject]
		public var userService:IUsersService;
		
		[Inject]
		public var userId:String;
		
		[Inject]
		public var raised:Boolean;
		
		override public function execute():void {
			if (raised) {
				trace("RaiseHandCommand.execute() - handRaised");
				userService.raiseHand();
			} else {
				trace("RaiseHandCommand.execute() - hand lowered for user " + userId + " by user " + userId);
				userService.lowerHand(userId, userSession.userId);
			}
		}
	}
}
