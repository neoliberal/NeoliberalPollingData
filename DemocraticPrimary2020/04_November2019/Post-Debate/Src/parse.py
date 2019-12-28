import bs4
import csv

soup = bs4.BeautifulSoup(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\November2019\Post-Debate\Raw\November 2019 Neoliberal Straw Poll.html", 'r'), 'html.parser')
fout = csv.writer(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\November2019\Post-Debate\Recode\November2019.csv", 'wb'))

fout.writerow(["Joe Biden", "Pete Buttigieg", "Kamala Harris", "Bernie Sanders", "Elizabeth Warren", "Cory Booker", "Andrew Yang", "Amy Klobuchar", "Tom Steyer", "Tulsi Gabbard"])

for ballot in soup.find_all("div", "ballot"):
    temp = []
    for vote in ballot.find_all("div", "rank"):
        try:
            temp.append(vote.contents[0])
        except IndexError:
            temp.append(u'10')
    # drop troll ballots
    #print(temp)
    if temp != [u'10', u'10', u'10', u'1', u'10', u'10', u'10', u'10', u'10', u'10']:
        if temp != [u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10']:
            if temp != [u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'1']:
                fout.writerow(temp)
            else:
                print("Tusli or Bust")
        else:
            print("Blank")
    else:
        print("Bernie or Bust")
