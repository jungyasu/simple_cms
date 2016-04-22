class DemoController < ApplicationController

# for now, we don't know layout yet so set false 
  layout 'application'

  def index
  	# render other template
  	# render(:template => 'demo/hello')
  	# render('demo/hello')
  	# render('hello') #name of the template
  end

  def hello
  	# render other template
  	# render(:template => 'demo/index')
  	# render('demo/index')
  	# render('index') #name of the template

  	# variable
  	# @instance_variable
  	@array = [1,2,3,4,5]
  	@id = params['id'].to_i #works either format # take it as integer because params are always string in ERB
  	@page = params[:page].to_i
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  	# redirect_to(:action => 'index')
  end

  def yasu
  	redirect_to('http://jungyasu.com')
  	# redirect_to(:action => 'index')
  end

  def text_helpers
  end

  def escape_out
  end

end
