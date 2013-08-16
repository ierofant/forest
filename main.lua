-- $Name: In the forest$
-- $Name(ru): В лесу$
-- $Version: 0.9$

instead_version '1.9.0'

dofile('forest.lua')
math.randomseed(os.time())

game.codepage = 'UTF-8'
game_title = 'В лесу'


global
{
    current_position = math.random(forest.size * forest.size),
    descriptions = {}
}


main = room
{
    nam = game_title,
    pic = 'images/forest.png',
    obj = {vway('Начать игру', '{Начать игру}', 'preview1')}
}

preview1 = room
{
    nam = game_title,
    dsc = [[Прихватив с собой своего верного пса Муху, я решил отправится в лес за грибами.
	    Это далеко не первая моя вылазка на лоно природы, обычно я ходил в знакомый лесок, что совсем недалеко от города.
	    Мне там известно, почти каждое деревце, каждая ямка.^^
	    Но одна беда, слишком уж много туда ходит народа, а сейчас как раз самый разгар сезона,
	    боюсь, что много я там не насобираю. Поэтому, в этот раз я, пожалуй,
	    наведаюсь в другой лес более дикий, и совершенно мне не знакомый.^^
	    Надеюсь, это будет познавательная и интересная прогулка.]],
    obj = {vway('Далее', '{Далее}', 'preview2')}
}

preview2 = room
{
    nam = game_title,
    dsc = [[Я довольно долго бродил по этому лесу, но совершенно безрезультатно, я ничего не нашёл.^^
	    Этот лес такой дремучий! Деревья-великаны очень старые, почти полностью закрывают небо,
	    везде полумрак и непроходимая чащоба.^^
	    Муха моя поначалу была очень игрива и, то и дело, убегала куда-то. Порой она совсем пропадала из виду.
	    Но потом стала жаться ко мне и постоянно озираться кругом.
	    Частенько она замирала и новостряла уши, как будто прислушивалась к чему-то.^^
	    Мне всё здесь надоело! Думаю, пора возврашаться домой с пустыми руками.
	    Правда, я начинаю сомневаться в какую сторону мне двигаться,
	    но ничего, куда-нибудь да выйду.]],
    obj = {vway('Далее', '{Далее}', 'forest')},

    entered = function() 
	for i = 0, forest.size * forest.size
	do
	    descriptions[i] = places[math.random(#places)]
	end;
    end
}
