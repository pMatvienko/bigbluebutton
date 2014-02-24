/**
 * BigBlueButton open source conferencing system - http://www.bigbluebutton.org/
 * 
 * Copyright (c) 2012 BigBlueButton Inc. and by respective authors (see below).
 *
 * This program is free software; you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free Software
 * Foundation; either version 3.0 of the License, or (at your option) any later
 * version.
 * 
 * BigBlueButton is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along
 * with BigBlueButton; if not, see <http://www.gnu.org/licenses/>.
 *
 */
package org.bigbluebutton.modules.phone
{
	import org.bigbluebutton.core.BBB;
	
	public class PhoneOptions {
		[Bindable]
		public var showButton:Boolean = true;

		[Bindable]
		public var autoJoin:Boolean = false;
		
		[Bindable]
		public var skipCheck:Boolean = false;
		
		[Bindable]
		public var enabledEchoCancel:Boolean = false;
		
		[Bindable]
		public var useWebrtcIfAvailable:Boolean = true;

    [Bindable]
    public var echoTestApp:String = "9196";
    
		public function PhoneOptions() {
			parseOptions();
		}
		
		public function parseOptions():void {
			var vxml:XML = BBB.getConfigForModule("PhoneModule");
			if (vxml != null) {
				if (vxml.@showButton != undefined) {
					showButton = (vxml.@showButton.toString().toUpperCase() == "TRUE") ? true : false;
				}
				if (vxml.@autoJoin != undefined) {
					autoJoin = (vxml.@autoJoin.toString().toUpperCase() == "TRUE") ? true : false;
				}
				if (vxml.@skipCheck != undefined) {
					skipCheck = (vxml.@skipCheck.toString().toUpperCase() == "TRUE") ? true : false;
				}
				if (vxml.@enabledEchoCancel != undefined) {
					enabledEchoCancel = (vxml.@enabledEchoCancel.toString().toUpperCase() == "TRUE") ? true : false;
				}
				if (vxml.@useWebrtcIfAvailable != undefined) {
					useWebrtcIfAvailable = (vxml.@useWebrtcIfAvailable.toString().toUpperCase() == "TRUE");
				}
        if (vxml.@echoTestApp != undefined) {
          echoTestApp = vxml.@echoTestApp.toString();
        }
			}
		}		
	}
}