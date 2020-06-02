# frozen_string_literal: true

class VagrantBolt::Config::Global < Vagrant.plugin('2', :config)
  # @!attribute [rw] bolt_exe
  # @return [String] The full path to the bolt command. If not passed in, the default from PATH will be used.
  attr_accessor :bolt_exe

  # @!attribute [rw] boltdir
  # @return [String] The bolt working directory. Defaults to `.`
  attr_accessor :boltdir

  # @!attribute [rw] host_key_check
  # @return [String] If the connection should check the host key on the remote host (linux)
  attr_accessor :connect_timeout

  # @!attribute [rw] host_key_check
  # @return [Boolean] If the connection should check the host key on the remote host (linux)
  attr_accessor :host_key_check

  # @!attribute [rw] machine_name
  # @return [String] The name of the machine to set in the bolt inventory
  attr_accessor :machine_name

  # @!attribute [rw] modulepath
  # @return [String] The path to the modules.
  attr_accessor :modulepath

  # @!attribute [rw] user
  # @return [String] The user to authenticate on the machine.
  attr_accessor :user

  # @!attribute [rw] password
  # @return [String] The password to authenticate on the machine.
  attr_accessor :password

  # @!attribute [rw] port
  # @return [String] The port to connect to the machine.
  attr_accessor :port

  # @!attribute [rw] private_key
  # @return [String] The path of the private_key to authenticate on the machine.
  attr_accessor :private_key

  # @!attribute [rw] run_as
  # @return [String] User to run as using privilege escalation.
  attr_accessor :run_as

  # @!attribute [rw] sudo_password
  # @return [String] The password to authenticate sudo on the machine.
  attr_accessor :sudo_password

  # @!attribute [rw] ssl
  # @return [Boolean] If the connection should use SSL on with WinRM (Windows)
  attr_accessor :ssl

  # @!attribute [rw] ssl_verify
  # @return [Boolean] If the connection should verify SSL on with WinRM (Windows)
  attr_accessor :ssl_verify

  # @!attribute [rw] tmpdir
  # @return [String] The directory to upload and execute temporary files on the target
  attr_accessor :tmpdir

  # @!attribute [rw] verbose
  # @return [Boolean] Shows verbose logging
  attr_accessor :verbose

  # @!attribute [rw] debug
  # @return [Boolean] Shows debug logging
  attr_accessor :debug

  # @!attribute [rw] facts
  # @return [Hash] A hash of facts for the machine
  attr_accessor :facts

  # @!attribute [rw] vars
  # @return [Hash] A hash of vars for the machine
  attr_accessor :vars

  # @!attribute [rw] features
  # @return [Array<String>] An array containing the features for this machine
  attr_accessor :features

  def initialize
    @bolt_exe        = UNSET_VALUE
    @boltdir         = UNSET_VALUE
    @connect_timeout = UNSET_VALUE
    @host_key_check  = UNSET_VALUE
    @machine_name    = UNSET_VALUE
    @modulepath      = UNSET_VALUE
    @password        = UNSET_VALUE
    @port            = UNSET_VALUE
    @private_key     = UNSET_VALUE
    @run_as          = UNSET_VALUE
    @ssl             = UNSET_VALUE
    @ssl_verify      = UNSET_VALUE
    @sudo_password   = UNSET_VALUE
    @tmpdir          = UNSET_VALUE
    @user            = UNSET_VALUE
    @verbose         = UNSET_VALUE
    @debug           = UNSET_VALUE
    @facts           = UNSET_VALUE
    @vars            = UNSET_VALUE
    @features        = UNSET_VALUE
  end

  def finalize!
    @bolt_exe        = bolt_exe_path if @bolt_exe == UNSET_VALUE
    @boltdir         = '.' if @boltdir == UNSET_VALUE
    @connect_timeout = nil if @connect_timeout == UNSET_VALUE
    @host_key_check  = nil if @host_key_check == UNSET_VALUE
    @machine_name    = nil if @machine_name == UNSET_VALUE
    @modulepath      = nil if @modulepath == UNSET_VALUE
    @port            = nil if @port == UNSET_VALUE
    @password        = nil if @password == UNSET_VALUE
    @private_key     = nil if @private_key == UNSET_VALUE
    @run_as          = nil if @run_as == UNSET_VALUE
    @ssl             = nil if @ssl == UNSET_VALUE
    @ssl_verify      = nil if @ssl_verify == UNSET_VALUE
    @sudo_password   = nil if @sudo_password == UNSET_VALUE
    @tmpdir          = nil if @tmpdir == UNSET_VALUE
    @user            = nil if @user == UNSET_VALUE
    @verbose         = nil if @verbose == UNSET_VALUE
    @debug           = nil if @debug == UNSET_VALUE
    @facts           = nil if @facts == UNSET_VALUE
    @features        = nil if @features == UNSET_VALUE
    @vars            = nil if @vars == UNSET_VALUE
  end

  # Get the full path to the bolt executable
  # @return [String] The path to the bolt exe
  def bolt_exe_path
    unless Vagrant::Util::Platform.windows?
      return '/opt/puppetlabs/bin/bolt' if File.file?('/opt/puppetlabs/bin/bolt')
    end
    Vagrant::Util::Which.which('bolt') || 'bolt'
  end

  def validate(_machine)
    errors = _detected_errors

    { "GlobalBolt" => errors }
  end

  # Generate a bolt inventory config hash for this config
  # @return [Hash] A bolt inventory config hash containing the configured params
  def inventory_config
    group_objects = ['facts', 'features', 'vars']
    config = {}
    instance_variables_hash.each do |key, value|
      next if value.nil? || (value == UNSET_VALUE)

      if group_objects.include?(key)
        config[key] = value
      elsif key == 'machine_name'
        config['name'] = value
      else
        setting_map.each do |transport, settings|
          next unless settings.include?(key)

          config['config'] ||= {}
          config['config'][transport.to_s] ||= {}
          config['config'][transport.to_s][key.tr('_', '-')] = value
        end
      end
    end
    config
  end

  # Return the setting map for the config hash
  # @return [Hash] A map of the settings to the transport
  def setting_map
    {
      'ssh': [
        'user',
        'password',
        'run_as',
        'port',
        'private_key',
        'connect_timeout',
        'host_key_check',
        'sudo_password',
        'tmpdir',
      ],
      'winrm': [
        'user',
        'password',
        'run_as',
        'ssl',
        'ssl_verify',
        'port',
        'tmpdir',
      ],
    }
  end
end
