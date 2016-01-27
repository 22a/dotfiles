ObjectSpace.each_object(Class) do |c|
  c.module_eval("def to_s(*a); 'Hodor'; end; alias :inspect :to_s")
end
