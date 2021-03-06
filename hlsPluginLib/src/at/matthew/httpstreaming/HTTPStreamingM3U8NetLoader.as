/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is the at.matthew.httpstreaming package.
 *
 * The Initial Developer of the Original Code is
 * Matthew Kaufman.
 * Portions created by the Initial Developer are Copyright (C) 2011
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** */
 
 package at.matthew.httpstreaming
{
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import org.osmf.media.MediaResourceBase;
	import org.osmf.media.URLResource;
	import org.osmf.net.httpstreaming.HTTPNetStream;
	import org.osmf.net.httpstreaming.HTTPStreamingNetLoader;
	import org.osmf.utils.URL;
		

	public class HTTPStreamingM3U8NetLoader extends HTTPStreamingNetLoader
	{
		override public function canHandleResource(resource:MediaResourceBase):Boolean
		{
			// nweber
			// Now that this is a secondary hidden loader, we don't need to worry about checking anything here.
			return true;
			
			// original
			// really should check the resource to see if it is a URL resource that ends in m3u8, then it can be tied
			// to the factory via a plugin and do the right thing
			//return true; //(resource.getMetadataValue(MetadataNamespaces.HTTP_STREAMING_METADATA) as Metadata) != null;
		}
		
		override protected function createNetStream(connection:NetConnection, resource:URLResource):NetStream
		{
			var httpNetStream:HTTPNetStream = new HTTPNetStream(connection, new HTTPStreamingM3U8Factory(), resource);
			return httpNetStream;
		}
	}
}