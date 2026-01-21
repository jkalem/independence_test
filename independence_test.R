

pvalue_indep<-function(x,y, m=100)
{

 n=dim(x)[1]
 kx=dim(x)[2]
 ky=dim(y)[2]
 
 N=n*(n-1)/2
  An=rep(NA,N)
  Bn=rep(NA,N)
  Cn=rep(NA,N)


  

  Z=array(dist(x,method="manhattan"))
 
  Z=pnorm(Z,mean(Z),sd(Z))
  Zord=sort(Z)
  T=array(dist(y,method="manhattan"))

  T=pnorm(T,mean(T),sd(T))
  Tord=sort(T)
  
   
  IRX2=1-(1/N^2)*sum((2*seq(1,N)-1)*Zord)
  IRY2=1-(1/N^2)*sum((2*seq(1,N)-1)*Tord)
  
  for(i in 1:N)
  {
    An[i]=mean((1-(1/2)*(abs(Z[i]-Z)+Z[i]+Z))*(1-(1/2)*(abs(T[i]-T)+T[i]+T)))
    Bn[i]=mean(1-(1/2)*(abs(T[i]-T)+T[i]+T))
    Cn[i]=mean(1-(1/2)*(abs(Z[i]-Z)+Z[i]+Z))
  }
  
  IRXY2=mean(An)
  
  IRXYRXRY=mean(Bn*Cn)
  
  tobs=n*(IRXY2+IRX2*IRY2-2*IRXYRXRY)

t=rep(0,m)

for( j in 1:m)
{
x=x[sample(sequence(n)),]
 Z=array(dist(x,method="manhattan"))
 
  Z=pnorm(Z,mean(Z),sd(Z))
  Zord=sort(Z)

  
  IRX2=1-(1/N^2)*sum((2*seq(1,N)-1)*Zord)

  for(i in 1:N)
  {
    An[i]=mean((1-(1/2)*(abs(Z[i]-Z)+Z[i]+Z))*(1-(1/2)*(abs(T[i]-T)+T[i]+T)))
    Bn[i]=mean(1-(1/2)*(abs(T[i]-T)+T[i]+T))
    Cn[i]=mean(1-(1/2)*(abs(Z[i]-Z)+Z[i]+Z))
  }
  
  IRXY2=mean(An)
  
  IRXYRXRY=mean(Bn*Cn)
  
  t[j]=n*(IRXY2+IRX2*IRY2-2*IRXYRXRY)
  
print(j)
}
pvalue=mean(t>tobs)
 paste0("pvalue =  ", pvalue)

}


