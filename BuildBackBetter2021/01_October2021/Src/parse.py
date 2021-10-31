import bs4
import csv
import os

i = 0
a = 0
b = 0

root = r"A:\Documents\Documents\GitHub\NeoliberalPollingData\BuildBackBetter2021\01_October2021"

fil = ["Payfor", "Spending"]

for z in fil:
    soup = bs4.BeautifulSoup(open(os.path.join(root, "Raw", z + ".html"), 'r'), 'html.parser')
    fout = csv.writer(open(os.path.join(root, "Recode", z + ".csv"), 'w', newline=""))

    if z == "Payfor":
        fout.writerow(["CarbonTax", "VAT", "PersonIncrease", "CapGains", "CorpIncrease", "Enforcement", "CorpMinTax", "WealthTax", "MAFees", "GasTax"])
    else:
        fout.writerow(["CTC", "ChildCare", "Leave", "GreenEnergy", "MedicareExpantion", "MedicaidExpansion", "CommunityColl", "MedicareDrugPrices", "SALT", "RentalAssistance"])

    for ballot in soup.find_all("div", "ballot"):
        temp = []
        for vote in ballot.find_all("div", "rank"):
            try:
                temp.append(vote.contents[0])
            except IndexError:
                temp.append(u'10')
        # drop troll ballots
        if temp != [u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10']:
            fout.writerow(temp)
        else:
            print("Blank")
