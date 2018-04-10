divert(`-1')
changequote(`«', `»')
changecom

Given the name of an environment variable, print its value to standard
output. If two or more parameters are given, awk's gsub [*] function
performs substitution on the value before it is printed, using the
second and third macro parameters as the first two gsub arguments.

If the variable does not exist, the expansion is void. The macro is
recognized only with parameters.

[*] http://pubs.opengroup.org/onlinepubs/9699919799/utilities/awk.html#tag_20_06_13_13

define(«printenv»,
       «ifelse(«$#», «0», ««$0»»,
               «$#», «1», «syscmd(«printf %s "$$1"»)»,
               «syscmd(«awk 'BEGIN { gsub($2, $3, ENVIRON["$1"])
                                     printf "%s", ENVIRON["$1"] }'»)»)»)

divert«»dnl
