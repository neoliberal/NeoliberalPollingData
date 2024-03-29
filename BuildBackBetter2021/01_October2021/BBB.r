library(tidyverse)
library(ggplot2)
library(ggthemes)

Payfor <- read.csv("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Recode/Payfor.csv")
Spending <- read.csv("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Recode/Spending.csv")


# Spending Graphs
ggplot(data=Spending, aes(x=CTC)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Child Tax Credit", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/CTC.png", plot=last_plot(), dpi=600)


ggplot(data=Spending, aes(x=ChildCare)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Child Care Assistance and Universal Pre-K", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/ChildCare.png", plot=last_plot(), dpi=600)


ggplot(data=Spending, aes(x=Leave)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Paid Family and Medical Leave", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/Leave.png", plot=last_plot(), dpi=600)

ggplot(data=Spending, aes(x=GreenEnergy)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Green Energy Incentives", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/GreenEnergy.png", plot=last_plot(), dpi=600)


ggplot(data=Spending, aes(x=MedicareExpantion)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Dental, Hearing, and Vision for Medicare", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/MedicareExpantion.png", plot=last_plot(), dpi=600)


ggplot(data=Spending, aes(x=MedicaidExpansion)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Federal Medicaid Expansion for Red States", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/MedicaidExpansion.png", plot=last_plot(), dpi=600)


ggplot(data=Spending, aes(x=CommunityColl)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Free Community College", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/CommunityColl.png", plot=last_plot(), dpi=600)


ggplot(data=Spending, aes(x=MedicareDrugPrices)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Medicare Negotiated Drug Prices", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/MedicareDrugPrices.png", plot=last_plot(), dpi=600)


ggplot(data=Spending, aes(x=SALT)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Eliminating the SALT Deduction Cap", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right") + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/SALT.png", plot=last_plot(), dpi=600)


ggplot(data=Spending, aes(x=RentalAssistance)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Rental Assistance for Low-Income Households", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/RentalAssistance.png", plot=last_plot(), dpi=600)



# Payfor Graphs
ggplot(data=Payfor, aes(x=CarbonTax)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Carbon Tax", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right") + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/CarbonTax.png", plot=last_plot(), dpi=600)


ggplot(data=Payfor, aes(x=VAT)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Value-Added Tax (VAT)", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/VAT.png", plot=last_plot(), dpi=600)


ggplot(data=Payfor, aes(x=PersonIncrease)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Top Income Tax Rate Increase", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/PersonIncrease.png", plot=last_plot(), dpi=600)


ggplot(data=Payfor, aes(x=CapGains)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Taxing Capital Gains as Income", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/CapGains.png", plot=last_plot(), dpi=600)


ggplot(data=Payfor, aes(x=CapGains)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Taxing Capital Gains as Income", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/CapGains.png", plot=last_plot(), dpi=600)


ggplot(data=Payfor, aes(x=CorpIncrease)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Corporate Tax Rate Increase", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right") + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/CorpIncrease.png", plot=last_plot(), dpi=600)


ggplot(data=Payfor, aes(x=WealthTax)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Wealth Tax", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right") + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/WealthTax.png", plot=last_plot(), dpi=600)


ggplot(data=Payfor, aes(x=MAFees)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Increased Mergers and Acquisitions Fees", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right") + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/MAFees.png", plot=last_plot(), dpi=600)


ggplot(data=Payfor, aes(x=GasTax)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Gas Tax Increase", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/GasTax.png", plot=last_plot(), dpi=600)

ggplot(data=Payfor, aes(x=Enforcement)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Increased Tax Enforcement", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/Enforcement.png", plot=last_plot(), dpi=600)

ggplot(data=Payfor, aes(x=CorpMinTax)) + 
  geom_histogram(aes(y = ..density..), bins = 10, binwidth = 1, color=rgb(.84, .82, .61), fill=rgb(.79, .76, .49)) +
  labs(title="Corporate Minimum Tax", y="Percent", x="Ranked Choice \n ← more favorable — less favorable →") +
  scale_y_continuous(labels = scales::percent_format(), position = "right", breaks = c(.05, .1, .15, .2, .25, .3, .35), limits = c(0, .4)) + 
  scale_x_continuous(breaks=1:10) + 
  theme_economist(base_family="Verdana", horizontal = TRUE) +
  scale_colour_economist()

ggsave("~/GitHub/NeoliberalPollingData/BuildBackBetter2021/01_October2021/Graphs/CorpMinTax.png", plot=last_plot(), dpi=600)