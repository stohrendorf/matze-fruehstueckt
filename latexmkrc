#!/usr/bin/env perl

$latex = 'latex  %O  --shell-escape %S';
$pdflatex = 'pdflatex  %O  --shell-escape %S';
$xelatex = 'xelatex  %O  --shell-escape %S';

@default_files = ("matze_fruehstueckt.tex");

sub makenlo2nls {
  system( "makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"" );
#  system( "splitindex -m \"texindy -L german-din\" \"$_[0].idx\"" );
}
add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );

# asy always succeeds...
sub asy { system("asy -tex latex -noprc -f pdf -noView '$_[0]'"); return 0; }
add_cus_dep("asy","pdf",0,"asy");

# $bibtex_use = 2;
# $biber = 'biber --debug %O %S';

push @generated_exts, "bbl";
push @generated_exts, "loa";
push @generated_exts, "maf";
push @generated_exts, "mtc";
push @generated_exts, "mtc0";
push @generated_exts, "nlo";
push @generated_exts, "nls";
push @generated_exts, "pre";
push @generated_exts, "ptc1";
push @generated_exts, "ptc2";
push @generated_exts, "ptc3";
push @generated_exts, "ptc4";
push @generated_exts, "ptc5";
push @generated_exts, "ptc6";
push @generated_exts, "ptc7";
push @generated_exts, "ptc8";
push @generated_exts, "ptc9";
push @generated_exts, "ptc10";
push @generated_exts, "ptc11";
push @generated_exts, "ptc12";
push @generated_exts, "ptc13";
push @generated_exts, "ptc14";
push @generated_exts, "ptc15";
push @generated_exts, "pyg";
push @generated_exts, "mw";
