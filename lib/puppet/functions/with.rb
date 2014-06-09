# Call a lambda with the given arguments. Since the parameters of the lambda
# are local to the lambda's scope, this can be used to create private sections
# of logic in a class so that the variables are not visible outside of the
# class.
Puppet::Functions.create_function(:with) do
  dispatch :with do
    param 'Object', 'arg'
    arg_count(0, :default)
    required_block_param
  end

  def with(*args)
    args[-1].call({}, *args[0..-2])
  end
end
