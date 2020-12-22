# frozen_string_literal: true

require 'config_builder/model'
require_relative 'monkey_patches'

class VagrantBolt::ConfigBuilder::Config < ConfigBuilder::Model::Base
  # @!attribute [rw] args
  # @return [String] Additional arguments for the bolt command
  def_model_attribute :args

  # @!attribute [rw] bolt_exe
  # @return [String] The full path to the bolt command. If not passed in, the default from PATH will be used.
  def_model_attribute :bolt_exe

  # @!attribute [rw] boltdir
  # @return [String] DEPRECATED use `project`.  The bolt working directory. Defaults to `.`
  def_model_attribute :boltdir

  # @!attribute [rw] debug
  # @return [Boolean] Shows debug logging
  def_model_attribute :debug

  # @!attribute [rw] connect_timeout
  # @return [String] The timeout for the ssh connection (linux)
  def_model_attribute :connect_timeout

  # @!attribute [rw] host_key_check
  # @return [Boolean] If the connection should check the host key on the remote host (linux)
  def_model_attribute :host_key_check

  # @!attribute [rw] machine_alias
  # @return [String] The alias of the machine to set in the bolt inventory
  def_model_attribute :machine_alias

  # @!attribute [rw] machine_name
  # @return [String] The name of the machine to set in the bolt inventory
  def_model_attribute :machine_name

  # @!attribute [rw] modulepath
  # @return [String] The path to the modules.
  def_model_attribute :modulepath

  # @!attribute [rw] name
  # @return [String] The name of task or plan to run
  def_model_attribute :name

  # @!attribute [rw] nodes
  # DEPRECATED. Use `targets` instead.
  # Note: The `node_list` will override this setting.
  # @return [Array<String, Symbol>, "ALL"] The nodes to run the task or plan on.
  # Valid values are an array of machine names or the string "ALL".
  def_model_attribute :nodes

  # @!attribute [rw] excludes
  # Note: The `target_list` will override this setting.
  # Note: This will be merged with `targets`, with `excludes` taking precidence.
  # @return [Array<String, Symbol>] The targets to exclude from running this task or plan on.
  # Valid values are an array of machine names.
  def_model_attribute :excludes

  # @!attribute [rw] node_list
  # DEPRECATED. Use `target_list` instead.
  # This setting overrides `nodes` and needs to be in the `protocol://ipaddress:port` URI format
  # @return [String] The bolt node list. This defaults to the current node.
  def_model_attribute :node_list

  # @!attribute [rw] noop
  # @return [Boolean] If the command should be run with noop. Only valid with tasks and apply.
  def_model_attribute :noop

  # @!attribute [rw] params
  # @return [Hash] The paramater hash for the task or plan
  def_model_attribute :params

  # @!attribute [rw] project
  # @return [String] The bolt working directory. Defaults to `.`
  def_model_attribute :project

  # @!attribute [rw] command
  # @return [Symbol] Whether bolt should use a task or plan
  def_model_attribute :command

  # @!attribute [rw] user
  # @return [String] The user to authenticate on the machine.
  def_model_attribute :user

  # @!attribute [rw] password
  # @return [String] The password to authenticate on the machine.
  def_model_attribute :password

  # @!attribute [rw] port
  # @return [String] The port to connect to the machine.
  def_model_attribute :port

  # @!attribute [rw] private_key
  # @return [String] The path of the private_key to authenticate on the machine.
  def_model_attribute :private_key

  # @!attribute [rw] run_as
  # @return [String] User to run as using privilege escalation.
  def_model_attribute :run_as

  # @!attribute [rw] sudo_password
  # @return [String] The password to authenticate sudo on the machine.
  def_model_attribute :sudo_password

  # @!attribute [rw] ssl
  # @return [Boolean] If the connection should use SSL on with WinRM (Windows)
  def_model_attribute :ssl

  # @!attribute [rw] ssl_verify
  # @return [Boolean] If the connection should verify SSL on with WinRM (Windows)
  def_model_attribute :ssl_verify

  # @!attribute [rw] targets
  # Note: The `target_list` will override this setting.
  # @return [Array<String, Symbol>, "ALL"] The targets to run the task or plan on.
  # Valid values are an array of machine names or the string "ALL".
  def_model_attribute :targets

  # @!attribute [rw] target_list
  # This setting overrides `targets` and needs to be in the `protocol://ipaddress:port` URI format
  # @return [String] The bolt target list. This defaults to the current target.
  def_model_attribute :target_list

  # @!attribute [rw] tmpdir
  # @return [String] The directory to upload and execute temporary files on the target
  def_model_attribute :tmpdir

  # @!attribute [rw] verbose
  # @return [Boolean] Shows verbose logging
  def_model_attribute :verbose

  # @!attribute [rw] facts
  # @return [Hash] A hash of facts for the machine
  def_model_attribute :facts

  # @!attribute [rw] vars
  # @return [Hash] A hash of vars for the machine
  def_model_attribute :vars

  # @!attribute [rw] features
  # @return [Array<String>] An array containing the features for this machine
  def_model_attribute :features

  # rubocop:disable Metrics/BlockLength
  def to_proc
    proc do |config|
      bolt = config.bolt
      with_attr(:args)            { |val| bolt.args            = val }
      with_attr(:bolt_exe)        { |val| bolt.bolt_exe        = val }
      with_attr(:command)         { |val| bolt.command         = val }
      with_attr(:boltdir)         { |val| bolt.boltdir         = val }
      with_attr(:debug)           { |val| bolt.debug           = val }
      with_attr(:connect_timeout) { |val| bolt.connect_timeout = val }
      with_attr(:host_key_check)  { |val| bolt.host_key_check  = val }
      with_attr(:machine_alias)   { |val| bolt.machine_alias   = val }
      with_attr(:machine_name)    { |val| bolt.machine_name    = val }
      with_attr(:modulepath)      { |val| bolt.modulepath      = val }
      with_attr(:name)            { |val| bolt.name            = val }
      with_attr(:nodes)           { |val| bolt.nodes           = val }
      with_attr(:noop)            { |val| bolt.noop            = val }
      with_attr(:excludes)        { |val| bolt.excludes        = val }
      with_attr(:node_list)       { |val| bolt.node_list       = val }
      with_attr(:params)          { |val| bolt.params          = val }
      with_attr(:user)            { |val| bolt.user            = val }
      with_attr(:password)        { |val| bolt.password        = val }
      with_attr(:port)            { |val| bolt.port            = val }
      with_attr(:private_key)     { |val| bolt.private_key     = val }
      with_attr(:project)         { |val| bolt.project         = val }
      with_attr(:run_as)          { |val| bolt.run_as          = val }
      with_attr(:sudo_password)   { |val| bolt.sudo_password   = val }
      with_attr(:ssl)             { |val| bolt.ssl             = val }
      with_attr(:ssl_verify)      { |val| bolt.ssl_verify      = val }
      with_attr(:targets)         { |val| bolt.targets         = val }
      with_attr(:target_list)     { |val| bolt.target_list     = val }
      with_attr(:tmpdir)          { |val| bolt.tmpdir          = val }
      with_attr(:verbose)         { |val| bolt.verbose         = val }
      with_attr(:facts)           { |val| bolt.facts           = val }
      with_attr(:features)        { |val| bolt.features        = val }
      with_attr(:vars)            { |val| bolt.vars            = val }
    end
  end
  # rubocop:enable Metrics/BlockLength
end
