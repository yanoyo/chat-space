private

def repository
  client.repository full_name
end

def full_name
  "#{owner}/#{name}"
end
