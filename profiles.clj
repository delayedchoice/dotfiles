{:repl
 {:repl-options
  {:init (clojure.core.server/start-server {:accept 'clojure.core.server/io-prepl
                                            :address "localhost"
                                            :port 55556
                                            :name "lein"})}}}
