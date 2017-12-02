此api核心函数

def find

  x = params[:x]

  y = params[:y]

  data = Wzx.where("pt<->point'(#{x},#{y})'<5").order("pt<->point'(#{x},#{y})'").first

  render json:data
