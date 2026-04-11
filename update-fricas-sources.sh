tar xvf fricas-1.3.13-full.tar.bz2 -C /tmp
export FRICAS_FULL_DIR=/tmp/fricas-1.3.13
rm -rf ./algebra/
cp -r $FRICAS_FULL_DIR/pre-generated/src/algebra/ ./
cp -r $FRICAS_FULL_DIR/pre-generated/target/algebra/* algebra/
cp $FRICAS_FULL_DIR/src/lisp/*.lisp lisp/

test -e $FRICAS_FULL_DIR/src/interp/apply.clisp || (echo 'configure and build in $FRICAS_FULL_DIR' && exit)

rm interp/*.lisp
cp $FRICAS_FULL_DIR/src/interp/*lisp interp/
cp $FRICAS_FULL_DIR/src/interp/exposed.lsp interp/exposed.lisp
rename clisp lisp interp/*.clisp
mkdir -p lib
cp $FRICAS_FULL_DIR/LICENSE.txt lib/copyright
cp $FRICAS_FULL_DIR/src/etc/summary lib/

rm lisp/compile-algebra.lisp lisp/compile-interp.lisp
for f in algebra/*.lsp; do echo "(compile-file \"$f\")" >> lisp/compile-algebra.lisp ; done
for f in interp/*.lisp; do echo "(compile-file \"$f\")" >> lisp/compile-interp.lisp ; done
