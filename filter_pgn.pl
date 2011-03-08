while(<>) {
    s/\{\[%emt \d+\.\d+\]\}//g;
    s/(\d+\. )/\n\1/g;
    print;
}
