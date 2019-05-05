create function GetPY(@str varchar(500))
returns varchar(500)
as
begin
   declare @cyc int,@length int,@str1 varchar(100),@charcate varbinary(20)
   set @cyc=1--从第几个字开始取
   set @length=len(@str)--输入汉字的长度
   set @str1=''--用于存放返回值
   while @cyc<=@length
       begin  
          select @charcate=cast(substring(@str,@cyc,1) as varbinary)--每次取出一个字并将其转变成二进制,便于与GBK编码表进行比较
 if @charcate>=0XB0A1 and @charcate<=0XB0C4
         set @str1=@str1+'A'--说明此汉字的首字母为A,以下同上
 else if @charcate>=0XB0C5 and @charcate<=0XB2C0
      set @str1=@str1+'B'
 else if @charcate>=0XB2C1 and @charcate<=0XB4ED
      set @str1=@str1+'C'
 else if @charcate>=0XB4EE and @charcate<=0XB6E9
      set @str1=@str1+'D'
 else if @charcate>=0XB6EA and @charcate<=0XB7A1
       set @str1=@str1+'E'
 else if @charcate>=0XB7A2 and @charcate<=0XB8C0
       set @str1=@str1+'F'
 else if @charcate>=0XB8C1 and @charcate<=0XB9FD
       set @str1=@str1+'G'
 else if @charcate>=0XB9FE and @charcate<=0XBBF6
       set @str1=@str1+'H'
 else if @charcate>=0XBBF7 and @charcate<=0XBFA5
       set @str1=@str1+'J'
 else if @charcate>=0XBFA6 and @charcate<=0XC0AB
       set @str1=@str1+'K'
 else if @charcate>=0XC0AC and @charcate<=0XC2E7
       set @str1=@str1+'L'
 else if @charcate>=0XC2E8 and @charcate<=0XC4C2
       set @str1=@str1+'M'
 else if @charcate>=0XC4C3 and @charcate<=0XC5B5
       set @str1=@str1+'N'
   else if @charcate>=0XC5B6 and @charcate<=0XC5BD
       set @str1=@str1+'O'
 else if @charcate>=0XC5BE and @charcate<=0XC6D9
       set @str1=@str1+'P'
 else if @charcate>=0XC6DA and @charcate<=0XC8BA
       set @str1=@str1+'Q'
 else if @charcate>=0XC8BB and @charcate<=0XC8F5
       set @str1=@str1+'R'
 else if @charcate>=0XC8F6 and @charcate<=0XCBF9
       set @str1=@str1+'S'
 else if @charcate>=0XCBFA and @charcate<=0XCDD9
      set @str1=@str1+'T'
 else if @charcate>=0XCDDA and @charcate<=0XCEF3
      set @str1=@str1+'W'
 else if @charcate>=0XCEF4 and @charcate<=0XD1B8
      set @str1=@str1+'X'
 else if @charcate>=0XD1B9 and @charcate<=0XD4D0
      set @str1=@str1+'Y'
 else if @charcate>=0XD4D1 and @charcate<=0XD7F9
      set @str1=@str1+'Z'
      set @cyc=@cyc+1--取出输入汉字的下一个字
 end
 return @str1--返回输入汉字的首字母
       end

select dbo.GetPY('原嘉洁')