Header
"%% Predicator Elixir".

Nonterminals predicates predicate.

Terminals lit load compare jfalse jtrue.

Rootsymbol predicates.

predicates -> predicate : '$1'.
predicates -> predicate jfalse predicate : ['$1', jfalse, '$3']. %% jfalse
predicates -> predicates jfalse predicate : {'$1', jfalse, '$3'}.
predicates -> predicate jtrue predicate : ['$1', jtrue, '$3']. %% jtrue
predicates -> predicates jtrue predicate : {'$1', jtrue, '$3'}.

predicate -> lit compare load : [unwrap('$1'), unwrap('$3'), unwrap('$2')].
predicate -> load compare lit : [unwrap('$1'), unwrap('$3'), unwrap('$2')].
predicate -> lit compare lit : [unwrap('$1'), unwrap('$3'), unwrap('$2')].
predicate -> load compare load : [unwrap('$1'), unwrap('$3'), unwrap('$2')].

Erlang code.

unwrap({INST,_,V}) -> [INST, V].
