import bs4
import csv

soup = bs4.BeautifulSoup(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\September2019\Post-Debate\Raw\September 2019 Neoliberal Project Post-Debate Straw Poll.html", 'r'), 'html.parser')
fout = csv.writer(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\September2019\Post-Debate\Recode\September2019.csv", 'wb'))

fout.writerow(["Joe Biden", "Cory Booker", "Pete Buttigieg", "Julian Castro", "Kamala Harris", "Amy Klobuchar", "Beto O'Rourke", "Bernie Sanders", "Elizabeth Warren", "Andrew Yang"])

for ballot in soup.find_all("div", "ballot"):
    temp = []
    for vote in ballot.find_all("div", "rank"):
        try:
            temp.append(vote.contents[0])
        except IndexError:
            temp.append(10)
    fout.writerow(temp)
