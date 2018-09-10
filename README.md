# Project Title

Log Combiner / Parser

## Purpose / History

A simple bash script to take multiple files and combine them, while filtering for relevant data.

I find myself frequently in a situation where I have a bunch of log files that I need to combine into one log file to get some information. I wrote a scrpt to do this intially (you can find it in the first commit) and over time it evolved into what it is now.

Please note this script is designed to meet my needs and might be a bit too customized for general use, but feel free to fork it and do what you want with it (it's not particularly complicated).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Instalation

First, clone the repo:

```
git clone git@github.com:brianbob/log-combiner.git [folder-name]
```

Then move the .sh file into the folder with the log files.

### Usage

The script will take multiple log files and combine them into one. For instance, if you have these log files:

```
example.com.log-01012000
example.com.log-01022000
example.com.log-01032000
example.com.log-01042000
example.com.log-01052000
example.com.log-01062000
```

and run the script, you get one log file that has all the data.

```
example.com
```

It also works for multiple domains.

example.com.log-01012000
example.com.log-01022000
example.com.log-01032000
example2.com.log-01042000
example2.com.log-01052000
example2.com.log-01062000
```

becomes


```
example.com
example2.com
```

This script is designed to pull out some piece of data, whethere that be the type of request (GET, POST, etc), the logs for a specific month or year, a specific browser (FF, Chrome, Edge, etc.), logs of a certain size, etc. This is passed as the first arguement.

```
bash log-combiner.sh Mozilla
```

You should be able to get everything by passing a space or dash (or some other character that will be in every request) as the first argument. If you don't pass anything, the script will throw an error. Again, feel free to fork this and cut that part out if you don't need it.

There is a second optional arugement, the output file name.


```
bash log-combiner.sh Mozilla test.log
```

This will output everything to test.log. If you don't pass a filename, one will be created based on the name of the logs it is parsing.

## Authors

* **Brian Bridge**

See also the list of [contributors](https://github.com/brianbob/draft-lottery/graphs/contributors) who participated in this project.

## License

This project is licensed under the GNU General Public License - see the [LICENSE.md](LICENSE.md) file for details
