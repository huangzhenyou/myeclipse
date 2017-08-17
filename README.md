#### 分号

1. 不要在行尾加分号
2. 不要用分号将两条命令放在同一行.


#### 行长度
1. 每行不要超过80个字符

2. 特殊情况可以超过80个字符：
- 除了长的导入模块语句
- 注释里的URL
  
  ```python
  #http://www.example.com/us/developer/documentation/api/content/v2.0/csv_file_name_extension_full_specification.html
  ```

3. 文本字符串在一个行过长时，用括号来实现隐式行连接
```python
x = ('This will build a very long long'
     'long long long long long string')
```

#### 括号
1. 不要在[返回语句]或[条件语句]中使用括号
```python
if x:
    bar()
if not x
    bar()
return foo
```


#### 缩进
1. 应该用4个空格来缩进代码
2. 不应该的操作
- 用Tab来缩进
- 用Tab和空格混用
```python
# 括号内分隔符对齐
foo = long_function_name(var_one, var_two,
                         var_three, var_four)

# 在字典开始分隔符对齐
foo = {
   long_dictionary_key: value1 +
                        value2,
   ...
}

# 在第一行四维悬挂缩进；
foo = long_function_name(
    var_one, var_two, var_three,
    var_four)

# 在字典的内悬挂缩进
foo = {
    long_dictionary_key:
        long_dictionary_value,
   ...
}
```

#### 空格
1. 应该在二元操作符两边加上一个空格，比如赋值(=)、比较(==, <, >, !=, <>, <=, >=, in, not in, is, is not), 布尔(and, or, not)
```python
x = 1
x and y
```

2. 不要在括号内加空格 
```python
spam(ham[1], {eggs:2}, [])
```
3. 不要在逗号, 分号, 冒号前面加空格, 
应该在它们后面加(除了在行尾).

```python
if x == 4:
    print x, y
x, y = y, x
```
4. 不要在参数列表, 索引或切片的左括号前加空格.
```python
spam(1)
dict['key'] = list[index]
```
5. 不要用空格来垂直对齐多行间的标记, 因为这会成为维护的负担(适用于:, #, =等)
```python
foo = 1000
long_name = 2

dictionary = {
    "foo": 1,
    "long_name": 2,
    }
```

#### 字符串
1.应该在同个文件中，保持使用字符串引号的一致。

```python
str = "Why are you hiding your eyes?"
print "hello world"
```


#### 导入格式
1. 导入语句应该放在文件顶部
```python
#coding:utf-8
import time
```
2. 每个导入应该独占一行
```python
from pyspark import SparkConf
from pyspark import SparkContext

```

3. 导入按照从最通用到不通过的顺序分组:
-    标准库导入
-    第三方库导入
-    应用程序指定导入

#### 语句
1. 通常每个语句应该独占一行

2. 特殊情况下(测试结果与测试语句在一行放得下)：
- 如果if语句，只有在没有else时才能这么做。
```python
if foo: bar(foo)
```
- try/except则不能放在同一行。

#### 命名
1. 应该避免的名称：
- 单字符名称，除了计数器和迭代器
- 包/模块名中的连字符(-)
- 双下划线开头并结尾的名称(Python保留, 例如__init__)
2. 命令约定
- 所谓”内部(Internal)”表示仅模块内可用, 或者, 在类内是保护或私有的.
- 用单下划线(_)开头表示模块变量或函数是protected的(使用import * from时不会包含).
- 用双下划线(__)开头的实例变量或方法表示类内私有.
- 将相关的类和顶级函数放在同一个模块里. 不像Java, 没必要限制一个类一个模块.
- 对类名使用大写字母开头的单词(如CapWords, 即Pascal风格), 但是模块名应该用小写加下划线的方式(如lower_with_under.py). 


#### 注释
- **在函数和方法中**

1. 一个函数必须有文档字符串，除非它满足一下条件：
- 外部不可见
- 非常短小
- 简单明了

文档字符串应该包含函数做什么, 以及输入和输出的详细描述. 通常, 不应该描述”怎么做”, 除非是一些复杂的算法. 文档字符串应该提供足够的信息, 当别人编写代码调用该函数时, 他不需要看一行代码, 只要看文档字符串就可以了. 对于复杂的代码, 在代码旁边加注释会比使用文档字符串更有意义.

关于函数的几个方面应该在特定的小节中进行描述记录， 这几个方面如下文所述. 每节应该以一个标题行开始. 标题行以冒号结尾. 除标题行外, 节的其他内容应被缩进2个空格.

**Arys：**

列出每个参数的名字, 并在名字后使用一个冒号和一个空格, 分隔对该参数的描述.如果描述太长超过了单行80字符,使用2或者4个空格的悬挂缩进(与文件其他部分保持一致). 描述应该包括所需的类型和含义. 如果一个函数接受*foo(可变长度参数列表)或者**bar (任意关键字参数), 应该详细列出*foo和**bar.


**Returns: (或者 Yields: 用于生成器)**

描述返回值的类型和语义. 如果函数返回None, 这一部分可以省略.

**Raises:**

列出与接口有关的所有异常.
```python
def fetch_bigtable_rows(big_table, keys, other_silly_variable=None):
    """Fetches rows from a Bigtable.

    Retrieves rows pertaining to the given keys from the Table instance
    represented by big_table.  Silly things may happen if
    other_silly_variable is not None.

    Args:
        big_table: An open Bigtable Table instance.
        keys: A sequence of strings representing the key of each table row
            to fetch.
        other_silly_variable: Another optional variable, that has a much
            longer name than the other args, and which does nothing.

    Returns:
        A dict mapping keys to the corresponding table row data
        fetched. Each row is represented as a tuple of strings. For
        example:

        {'Serak': ('Rigel VII', 'Preparer'),
         'Zim': ('Irk', 'Invader'),
         'Lrrr': ('Omicron Persei 8', 'Emperor')}

        If a key from the keys argument is missing from the dictionary,
        then that row was not found in the table.

    Raises:
        IOError: An error occurred accessing the bigtable.Table object.
    """
    pass
```

#### 类
类应该在其定义下有一个用于描述该类的文档字符串. 如果你的类有公共属性(Attributes), 那么文档中应该有一个属性(Attributes)段. 并且应该遵守和函数参数相同的格式.
```python
class SampleClass(object):
    """Summary of class here.

    Longer class information....
    Longer class information....

    Attributes:
        likes_spam: A boolean indicating if we like SPAM or not.
        eggs: An integer count of the eggs we have laid.
    """

    def __init__(self, likes_spam=False):
        """Inits SampleClass with blah."""
        self.likes_spam = likes_spam
        self.eggs = 0

    def public_method(self):
        """Performs operation blah."""
```


#### 块注释和行注释
最需要写注释的是代码中那些技巧性的部分. 如果你在下次 代码审查 的时候必须解释一下, 那么你应该现在就给它写注释. 对于复杂的操作, 应该在其操作开始前写上若干行注释

1. 对于不是一目了然的代码，应在其行尾添加注释
```python
if i & (i-1) == 0:   # true iff i is a power of 2
```

2. 为了提高可读性，注释应该离开代码2个空格





#### 空行
顶级定义之间空两行, 方法定义之间空一行


