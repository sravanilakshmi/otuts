class TutorialsController < ApplicationController

  before_filter :user_logged_in, :only => [:new, :create, :edit, :update]

  helper_method :coderay

  def index

    @tags = Tag.all

    @tutorials = Tutorial.order("title").page(params[:page]).per(4)

    unless params[:tags].nil?
      @tutorials = Tutorial.tagged_with(params[:tags]).page(params[:page]).per(3)
    end

    unless params["top_search_field"].nil?
      @tutorials = Tutorial.tagged_with( params["top_search_field"].split(" "), :any => true).page(params[:page]).per(3)
    end
  end

  def create
    @tutorial = Tutorial.new(params[:tutorial])
    if @tutorial.save
      @tutorial.tag_list = params[:tags]
      if @tutorial.save
        flash[:notice] = "Tutorial created successfully"
        redirect_to :action => :index
      end
    else
      render :action => "new"
    end
  end

  def new
    @tags = Tag.select("id, name").to_json
    @tutorial = Tutorial.new
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  def edit
    @tags = Tag.select("id, name").to_json
    @tutorial = Tutorial.find(params[:id])
  end

  def update
    @tutorial = Tutorial.find(params[:id])
    if @tutorial.update_attributes(params[:tutorial])
      @tutorial.tag_list = params[:tags]
      if @tutorial.update_attributes(params[:tutorial])
        redirect_to tutorial_path
      end
    end
  end

  def get_coderay
    render :text => coderay(params[:text])
  end

  private

  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      CodeRay.scan($3, $2).div(:css => :class)
    end
  end

end
