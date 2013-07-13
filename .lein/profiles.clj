{:user {:dependencies [[criterium "0.4.1"]
                       [org.clojure/tools.namespace "0.2.3"]
                       [org.thnetos/cd-client "0.3.6"]]
        :injections [(require '(clojure.tools.namespace repl find))]
        :plugins [[lein-ancient "0.4.2"]
                  [lein-bin "0.3.4"]
                  [lein-cloverage "1.0.2"]
                  [lein-difftest "2.0.0"]
                  [lein-grep "0.1.0"]
                  [lein-idefiles "0.2.0"]
                  [lein-licenses "0.1.1"]
                  [lein-nevam "0.1.2"]
                  [lein-pprint "1.1.1"]
                  [lein-light "0.0.27"]
                  [lein-midje "3.0.1"]]}}