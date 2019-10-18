import bs4
import csv

soup = bs4.BeautifulSoup(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\October2019\Post-Debate\Raw\October 2019 Neoliberal Straw Poll.html", 'r'), 'html.parser')
fout = csv.writer(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\October2019\Post-Debate\Recode\October2019.csv", 'wb'))

fout.writerow(["Joe Biden", "Pete Buttigieg", "Kamala Harris", "Bernie Sanders", "Elizabeth Warren", "Cory Booker", "Beto O'Rourke", "Andrew Yang", "Amy Klobuchar", "Tom Steyer", "Julian Castro", "Tulsi Gabbard"])

for ballot in soup.find_all("div", "ballot"):
    temp = []
    for vote in ballot.find_all("div", "rank"):
        try:
            temp.append(vote.contents[0])
        except IndexError:
            temp.append(12)
    fout.writerow(temp)  
