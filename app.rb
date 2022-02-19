def main
   menu
end

def menu
    puts "Como preferer Enviar os dados do cartão ?"
    puts "1 - para digitar"
    puts "2 - para ler um arquivo"
    option = Integer(gets)

    if option == 1
        puts "Digite o numero do cartão"
        card = gets
        card.strip

        if firstCheck(card) == false 
            puts 'Cartão Inválido'
        else
            if secondCheck(card) == false
                puts 'Cartão Inválido'
            else
                if thirdCheck(card) == false
                    puts 'Cartão Inválido'
                else
                     if fourthCheck(card) == false
                        puts 'Cartão Inválido'
                     else
                        fifthCheck(card)
                     end
                end
            end
        end
    elsif
        option == 2
        arq = File.open("arquivo.txt", "r")
        fileItems  = (a = File.readlines("arquivo.txt"))
        for item in fileItems
            card = item
            if firstCheck(card) == false 
                puts 'Cartão Inválido'
            else
                if secondCheck(card) == false
                    puts 'Cartão Inválido'
                else
                    if thirdCheck(card) == false
                        puts 'Cartão Inválido'
                    else
                         if fourthCheck(card) == false
                            puts 'Cartão Inválido'
                         else
                            fifthCheck(card)
                         end
                    end
                end
            end
        end
    end
end

#start with a 4, 5 or 6. 
def firstCheck(card)
    isCardValid = false
    arrayCard = card.chars
    firstElement = Integer(arrayCard[0])

    if firstElement == 4 
        isCardValid = true
    elsif firstElement == 5
        isCardValid = true
    elsif firstElement == 6
        isCardValid = true
    end

    return isCardValid
end
 
#It must only consist of digits (0-9). 
def secondCheck(card)
    isCardValid = nil
    arrayCard = card.chars
    arrayCard.pop()
    c = 1

   for element in arrayCard
       if element != '0' 
        if element != '1'
            if element != '2'
                if element != '3'
                    if element != '4'
                        if element != '5'
                            if element != '6'
                                if element != '7'
                                    if element != '8'
                                        if element != '9'
                                            if element != '-'
                                                c += 1
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
       end
   end

   if c > 1
    isCardValid = false
   else
    isCardValid = true
   end
    
   return isCardValid
end

#It must contain exactly 16 digits.
def thirdCheck(card)
    arrayCard = card.chars
    arrayCard.pop()
    isCardValid = false

    if arrayCard.size == 16 or 19 
        isCardValid = true
    else
        isCardValid = false
    end

    return isCardValid
end

# It may have digits in groups of 4, separated by one hyphen "-". 
# It must NOT use any other separator like ' ' , '_', etc
def fourthCheck(card)
    isCardValid = false
    arrayCard = card.chars
    arrayCard.pop()
    arrayCard.delete(' ')

    cardWithHifen = "#{arrayCard[0]}#{arrayCard[1]}#{arrayCard[2]}#{arrayCard[3]}-#{arrayCard[5]}#{arrayCard[6]}#{arrayCard[7]}#{arrayCard[8]}-#{arrayCard[10]}#{arrayCard[11]}#{arrayCard[12]}#{arrayCard[13]}-#{arrayCard[15]}#{arrayCard[16]}#{arrayCard[17]}#{arrayCard[18]}"
    cardWithoutHifen = "#{arrayCard[0]}#{arrayCard[1]}#{arrayCard[2]}#{arrayCard[3]}#{arrayCard[4]}#{arrayCard[5]}#{arrayCard[6]}#{arrayCard[7]}#{arrayCard[8]}#{arrayCard[9]}#{arrayCard[10]}#{arrayCard[11]}#{arrayCard[12]}#{arrayCard[13]}#{arrayCard[14]}#{arrayCard[15]}"
  
    arrayWithHifen = cardWithHifen.chars
    arrayWithoutHifen = cardWithoutHifen.chars

   if arrayCard ==  arrayWithHifen or arrayCard == arrayWithoutHifen
        isCardValid = true
    else
        isCardValid = false
    end

    return isCardValid
end

# It must NOT have 4 or more consecutive repeated digits.
def fifthCheck(card)
    isCardValid = true
    arrayCard = card.chars
    arrayCard.pop()


    newArrayInteger = arrayCard.map do |i|
       i.to_i
    end

    #card without hyphen
    if ("#{newArrayInteger[0]}" ==  "#{newArrayInteger[1]}" ) == true && ("#{newArrayInteger[1]}" ==  "#{newArrayInteger[2]}" ) == true && ("#{newArrayInteger[2]}" ==  "#{newArrayInteger[3]}" ) == true
        isCardValid = false
    end

    if ("#{newArrayInteger[1]}" ==  "#{newArrayInteger[2]}" ) == true && ("#{newArrayInteger[2]}" ==  "#{newArrayInteger[3]}" ) == true && ("#{newArrayInteger[3]}" ==  "#{newArrayInteger[4]}")  == true
        isCardValid = false
    end

    if ("#{newArrayInteger[2]}" ==  "#{newArrayInteger[3]}" ) == true && ("#{newArrayInteger[3]}" ==  "#{newArrayInteger[4]}" ) == true && ("#{newArrayInteger[4]}" ==  "#{newArrayInteger[5]}")  == true
        isCardValid = false
    end

    if ("#{newArrayInteger[3]}" ==  "#{newArrayInteger[4]}" ) == true && ("#{newArrayInteger[4]}" ==  "#{newArrayInteger[5]}" ) == true && ("#{newArrayInteger[5]}" ==  "#{newArrayInteger[6]}")  == true
        isCardValid = false
    end

    if ("#{newArrayInteger[4]}" ==  "#{newArrayInteger[5]}" ) == true && ("#{newArrayInteger[5]}" ==  "#{newArrayInteger[6]}" ) == true && ("#{newArrayInteger[6]}" ==  "#{newArrayInteger[7]}")  == true
        isCardValid = false
    end

    if ("#{newArrayInteger[5]}" ==  "#{newArrayInteger[6]}" ) == true && ("#{newArrayInteger[6]}" ==  "#{newArrayInteger[7]}" ) == true && ("#{newArrayInteger[7]}" ==  "#{newArrayInteger[8]}")  == true
        isCardValid = false
    end

    # card with hyphen
    if ("#{newArrayInteger[4]}" == "0")  == true && ("#{newArrayInteger[1]}" ==  "#{newArrayInteger[2]}" ) == true && ("#{newArrayInteger[2]}" ==  "#{newArrayInteger[3]}" ) == true && ("#{newArrayInteger[3]}" ==  "#{newArrayInteger[5]}" ) == true
        isCardValid = false
    end

    if "#{newArrayInteger[4]}" == "0" && ("#{newArrayInteger[2]}" ==  "#{newArrayInteger[3]}" ) == true && ("#{newArrayInteger[3]}" ==  "#{newArrayInteger[5]}" ) == true && ("#{newArrayInteger[5]}" ==  "#{newArrayInteger[6]}" ) == true
        isCardValid = false
    end

    if "#{newArrayInteger[4]}" == "0" && ("#{newArrayInteger[7]}" ==  "#{newArrayInteger[8]}" ) == true && ("#{newArrayInteger[8]}" ==  "#{newArrayInteger[9]}" ) == true && ("#{newArrayInteger[9]}" ==  "#{newArrayInteger[10]}" ) == true
        isCardValid = false
    end

    if ("#{newArrayInteger[4]}" == "0") == true && ("#{newArrayInteger[11]}" ==  "#{newArrayInteger[12]}" ) == true && ("#{newArrayInteger[12]}" ==  "#{newArrayInteger[13]}" ) == true && ("#{newArrayInteger[13]}" ==  "#{newArrayInteger[14]}" ) == true
        isCardValid = false
    end

    if "#{newArrayInteger[4]}" == "0" && ("#{newArrayInteger[13]}" ==  "#{newArrayInteger[14]}" ) == true && ("#{newArrayInteger[14]}" ==  "#{newArrayInteger[15]}" ) == true && ("#{newArrayInteger[15]}" ==  "#{newArrayInteger[16]}" ) == true
        isCardValid = false
    end

    if "#{newArrayInteger[4]}" == "0" && ("#{newArrayInteger[15]}" ==  "#{newArrayInteger[16]}" ) == true && ("#{newArrayInteger[16]}" ==  "#{newArrayInteger[17]}" ) == true && ("#{newArrayInteger[17]}" ==  "#{newArrayInteger[18]}" ) == true
        isCardValid = false
    end

   
    if isCardValid == true
        puts 'Cartão válido'
    else
        puts 'Cartão Inválido'
    end
end

main