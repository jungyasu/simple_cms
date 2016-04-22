class SubjectsController < ApplicationController
  # layout false
  layout "admin"
  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    #if left blank, the initial values will be nil
    @subject = Subject.new( {:name => "Default"} )
    @subject_count = Subject.count + 1
  end

  def create
    #instantiate a new object using form parameters
    # @subject= Subject.new(params[:subject])
    @subject = Subject.new(subject_params)
    #save the object
    if @subject.save
    #if save succeeds, redirect to the index action
      flash[:notice] = "Subject created successfully."
      redirect_to(:action => 'index')
    else
    #if savefails, re-display the form so user can fix problems
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    #
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
    # if update succeeds, redirect to the index action
      flash[:notice] = "Subject updated successfully."
      redirect_to(:action => 'show', :id => @subject.id)
    else
    # if update fails, re-display the form so user can fix problems
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    # Find an existing object using form parameters "not instance"
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  private
    def subject_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :position, :visible, :created_at)
    end

end
