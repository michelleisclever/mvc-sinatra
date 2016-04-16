class Person < ActiveRecord::Base
    
validates_presence_of :birthdate, :first_name, :last_name
    
    def self.get_number(my_birthdate)
numbers = my_birthdate[0].to_i + my_birthdate[1].to_i + my_birthdate[2].to_i + my_birthdate[3].to_i + my_birthdate[4].to_i + my_birthdate[5].to_i + my_birthdate[6].to_i + my_birthdate[7].to_i + my_birthdate[8].to_i + my_birthdate[9].to_i
#puts "My number is #{numbers}"
numbers = numbers.to_s
numbers = numbers[0].to_i + numbers[1].to_i
if numbers > 9
    numbers = numbers.to_s
    numbers = numbers[0].to_i + numbers[1].to_i
end
    return numbers
end
    
    def self.message_to(number)
case number
    when 1
    message = "#{number}. \nOne is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
    when 2
    message = "#{number}. \nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
    when 3
    message = "#{number}. \nNumber Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic. Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
    when 4
    message = "#{number}. \nThis is the worker. Practical, with a love of detail. Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
    when 5
    message = "#{number}. \nThis is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
    when 6
    message = "#{number}. \nThis is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
    when 7
    message = "#{number}. \nThis is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
    when 8
    message = "#{number}. \nThis is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
    when 9
    message = "#{number}. \nThis is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
else message = "Uh oh! Your birth path number is not 1-9!"
end
end

    def self.valid_birthdate(input)
    if(input.length == 8 && !input.match(/^[0-9]+[0-9]$/).nil?)
        return true
    else
        return false
    end
end    
end