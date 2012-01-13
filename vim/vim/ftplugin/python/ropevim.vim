function! LoadRope()
python << EOF
try:
    import ropevim
except:
    pass
EOF
endfunction

call LoadRope()
