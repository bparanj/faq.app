class FaqsController < ApplicationController
  def index
    @faqs = Faq.order('position')
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      redirect_to @faq, notice: "Successfully created FAQ."
    else
      render :new
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update_attributes(params[:faq])
      redirect_to @faq, notice: "Successfully updated FAQ."
    else
      render :edit
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    redirect_to faqs_url, notice: "Successfully destroyed FAQ."
  end

  def sort
    params[:faq].each_with_index do |id, index|
      Faq.where(id: id).update_all({position: index+1})
    end
    head :no_content
  end
end
