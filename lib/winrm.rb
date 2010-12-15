#############################################################################
# Copyright © 2010 Dan Wanek <dan.wanek@gmail.com>
#
#
# This file is part of WinRM.
# 
# WinRM is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# WinRM is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with WinRM.  If not, see <http://www.gnu.org/licenses/>.
#############################################################################

# We only what one instance of this class so include Singleton
require 'singleton'
require 'date'
require 'base64'
require 'uuid'
require 'kconv'

# Class Extensions
require 'extensions/string'

# Load the backend SOAP infrastructure.  Today this is Handsoap.
require 'soap/soap_provider'


module WinRM
  class WinRM
    include Singleton

    attr_reader :winrm

    # Set the endpoint for WinRM Web Services.  
    # @param [String] endpoint The URL of the endpoint.
    #   https://myserver:5986/wsman
    # @param [Integer] version The SOAP version to use.  This defaults to 1
    #   and you should not need to pass this parameter.
    def self.endpoint=(endpoint, version = 2)
      @endpoint = endpoint
    end

    # Fetch the current endpoint
    def self.endpoint
      @endpoint
    end

    # Set the SOAP username and password.
    # @param [String] user The user name
    # @param [String] pass The password
    def self.set_auth(user,pass)
      winrm.set_auth(user,pass)
    end

    def self.set_ca_trust_path(path)
      winrm.set_ca_trust_path(path)
    end

    # Set the http driver that the SOAP back-end will use.
    # @param [Symbol] driver The HTTP driver.  Available drivers:
    #   :curb, :net_http, :http_client(Default)
    def self.set_http_driver(driver)
      Handsoap.http_driver = driver
    end

    def winrm
      @winrm ||= SOAP::WinRMWebService.new(@endpoint)
    end

    # Run a CMD command
    # @see WinRM::SOAP::WinRMWebService#run_cmd
    def cmd(command)
      winrm.run_cmd(command)
    end

    # Run a Powershell script
    # @see WinRM::SOAP::WinRMWebService#run_powershell_script
    def powershell(script_file)
      winrm.run_powershell_script(script_file)
    end

    # Run a WQL Query
    # @see WinRM::SOAP::WinRMWebService#run_wql
    # @see http://msdn.microsoft.com/en-us/library/aa394606(VS.85).aspx
    def wql(wql)
      winrm.run_wql(wql)
    end

  end # class WinRM
end
