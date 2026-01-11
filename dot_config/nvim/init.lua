local opt = vim.opt

-- 들여쓰기 설정
opt.tabstop = 2      -- 탭 문자를 2칸으로 보여줌
opt.shiftwidth = 2   -- 자동 들여쓰기나 >>, << 시 2칸 이동
opt.softtabstop = 2  -- 탭 키 누를 때 2칸 이동
opt.expandtab = true -- 탭을 공백으로 변환

-- UI 설정
opt.number = true    -- 줄 번호 표시
opt.cursorline = true -- 현재 행 하이라이트
opt.hlsearch = true  -- 검색 결과 하이라이트

-- 구문 강조 및 파일 형식 설정
-- Neovim은 'syntax on'과 'filetype' 설정이 기본으로 켜져 있어 생략 가능합니다.
vim.cmd('colorscheme desert') -- 컬러 스킴 설정

