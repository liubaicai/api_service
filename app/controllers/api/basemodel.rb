
class Model
  def initialize (code,message,data)
    @code = code
    @message = message
    @data = data
  end

  def self.create (code,message,data,page,per_page,total)

    m = Model.new(code,message,data)

    m.page = page
    m.per_page = per_page
    m.total = total

    return m
  end

  def to_model
    return Hash[:code => @code, :message => @message, :data => @data]
  end

  def to_model4list
    return Hash[:code => @code, :message => @message, :page => @page, :per_page => @per_page, :total => @total, :data => @data]
  end

  def code
    @code
  end

  def message
    @message
  end

  def data
    @data
  end

  def page
    @page
  end
  def page=(page)
    @page=page
  end

  def per_page
    @per_page
  end
  def per_page=(per_page)
    @per_page=per_page
  end

  def total
    @total
  end
  def total=(total)
    @total=total
  end
end