class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = @distributor.users.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = @distributor.users.build
    set_interests_for_user!

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    set_interests_for_user!
  end

  # POST /users
  # POST /users.xml
  def create
    @user = @distributor.users.build(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to([@distributor, @user], :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => [@distributor, @user] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to([@distributor, @user], :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to([@distributor, :users]) }
      format.xml  { head :ok }
    end
  end

protected
  def set_interests_for_user!
    if @user.new_record?
      @distributor.offers.all.each do |offer|
        @user.interests.build(:offer => offer)
      end
    else
      (@distributor.offers.all - @user.offers).each do |offer|
        @user.interests.build(:offer => offer)
      end
    end
  end
end
