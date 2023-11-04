"""
>>> n
16062259105712611209641658803190570400275245423672565787419091295680620630785636971558307219989530395394351499203281426519149362261759281539568702011769646478712070463145873420965597842491127064303199483527738749166638206307327574630355099178660047431753528724835063346908731252815316778281052932638670885211701080477763810068356054881425322001385152021489353094787763088758326943743937262581410034348074153242288680028233164465400839866854038350564190411502011571268917111722149436826368470183296345516908682906766782295193600337595134665852536767389379885667423644433503645204133175355911340642871592145357026360057
>>> p
90702118856354201357346323391646236674100203259252633327092703094506118607919422739250589616809065704462702155205647639998332979610158549491068157133018498465908918749825279379426063668407469024873408225040887221325913019804205176639412760471599570772611257228693332668261037162211848144682514143824517420027
>>> q
177088025155736019940038050428211501298203420105702659741772695045090666275832068427838587869362494188696900901053136855166526598262576901088345527534603226640891707615113636996192887115917591528301071643323710464530801027212649524694474130285444884645596726071930937129893298856438902920249760536348838708891
"""

"""
In this problem, we have to find 50 upper digits. We are given 258 digits at end out of total 308 digits. we have to recover p_upper
"""

n = 16062259105712611209641658803190570400275245423672565787419091295680620630785636971558307219989530395394351499203281426519149362261759281539568702011769646478712070463145873420965597842491127064303199483527738749166638206307327574630355099178660047431753528724835063346908731252815316778281052932638670885211701080477763810068356054881425322001385152021489353094787763088758326943743937262581410034348074153242288680028233164465400839866854038350564190411502011571268917111722149436826368470183296345516908682906766782295193600337595134665852536767389379885667423644433503645204133175355911340642871592145357026360057
p = 90702118856354201357346323391646236674100203259252633327092703094506118607919422739250589616809065704462702155205647639998332979610158549491068157133018498465908918749825279379426063668407469024873408225040887221325913019804205176639412760471599570772611257228693332668261037162211848144682514143824517420027
p_lower = 633327092703094506118607919422739250589616809065704462702155205647639998332979610158549491068157133018498465908918749825279379426063668407469024873408225040887221325913019804205176639412760471599570772611257228693332668261037162211848144682514143824517420027
p_upper = 90702118856354201357346323391646236674100203259252
# p_lower 258
assert p == p_upper * 10 ** 258 + p_lower    # lost 50 upper digits out of 308

P.<x> = Zmod(n)[]
f = x * 10 ^ 258 + p_lower
print(f.monic().small_roots(beta=0.48))