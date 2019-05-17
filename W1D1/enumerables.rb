class Array

  def my_each(&prc)
    i = 0
    # prc ||=Proc.new {|ele| ele}

    while i < self.length
      self[i] = prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
  
    new_arr = []

    self.my_each {|ele| new_arr << ele if prc.call(ele)}

    new_arr 
  end

  def my_reject(&prc)
    new_arr = []

    self.my_each { |ele| new_arr << ele if !prc.call(ele) }

    new_arr
  end

  def my_any?(&prc)
    self.my_each { |ele| return true if prc.call(ele) }
    false
  end

  def my_all?(&prc)
    self.my_each { |ele| return false if !prc.call(ele) }
    true
  end

  def my_flatten
    return [self] if !self.is_a?(Array)

    flat = []

    self.each do |sub|
      if sub.is_a?(Array)
        flat += sub.my_flatten
      else
        flat << sub
      end
    end

    flat
  end

  def my_zip(*arg)
    zipped = []

    self.length.times do |i|
      sub = []

      sub << self[i]
      arg.each do |ele|
        sub << ele[i] 
      end
      
      zipped << sub
    end

    zipped
  end

  def my_rotate(rotation=1)

    if rotation > 0
      rotation.times do 
        ele = self.shift  
        self << ele
      end
    else
      rotation.abs.times do 
        ele = self.pop
        self.unshift(ele)
      end
    end

    self
  end

  def my_join(seperator="")
    str = ""

    (0...self.length).each do |i|
      
      if i == self.length - 1
        str += self[i]
      else 
        str += self[i] + seperator
      end

    end

    str
  end


  def my_reverse
    array = []

    i = self.length - 1
    while i >= 0
      array << self[i]
      i -= 1
    end

    array
  end

end
