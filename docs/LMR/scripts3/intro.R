# Chapter: Introduction


# Before You Start


# Initial Data Analysis

data(pima, package="faraway")
head(pima)
summary(pima)
sort(pima$diastolic)
pima$diastolic[pima$diastolic == 0]  = NA
pima$glucose[pima$glucose == 0] = NA
pima$triceps[pima$triceps == 0]  = NA
pima$insulin[pima$insulin == 0] = NA
pima$bmi[pima$bmi == 0] = NA
pima$test = factor(pima$test)
summary(pima$test)
levels(pima$test) = c("negative","positive")
summary(pima)
hist(pima$diastolic,xlab="Diastolic",main="")
plot(density(pima$diastolic,na.rm=TRUE),main="")
plot(sort(pima$diastolic),ylab="Sorted Diastolic")
plot(diabetes ~ diastolic,pima)
plot(diabetes ~ test,pima)
library(ggplot2)
ggplot(pima,aes(x=diastolic))+geom_histogram()
ggplot(pima,aes(x=diastolic))+geom_density()
ggplot(pima,aes(x=diastolic,y=diabetes))+geom_point()
ggplot(pima,aes(x=diastolic, y=diabetes, shape=test)) +
    geom_point()+
    theme(legend.position = "top",
          legend.direction = "horizontal")
ggplot(pima,aes(x=diastolic,y=diabetes)) +
    geom_point(size=1) + facet_grid(~ test)

# When to Use Linear Modeling


# History

data(manilius, package="faraway")
head(manilius)
(moon3 = aggregate(manilius[,1:3],list(manilius$group), sum))
solve(cbind(9,moon3$sinang,moon3$cosang), moon3$arc)
lmod = lm(arc ~ sinang + cosang, manilius)
coef(lmod)
data(GaltonFamilies, package="HistData")
plot(childHeight ~ midparentHeight, GaltonFamilies)
lmod = lm(childHeight ~ midparentHeight, GaltonFamilies)
coef(lmod)
abline(lmod)
(beta = with(GaltonFamilies,
      cor(midparentHeight,
      childHeight) * sd(childHeight) / sd(midparentHeight)))
(alpha = with(GaltonFamilies,
       mean(childHeight) - beta * mean(midparentHeight)))
(beta1 = with(GaltonFamilies,
       sd(childHeight) / sd(midparentHeight)))
(alpha1 = with(GaltonFamilies,
        mean(childHeight) - beta1 * mean(midparentHeight)))
abline(alpha1, beta1, lty=2)

# Exercises

sessionInfo()
