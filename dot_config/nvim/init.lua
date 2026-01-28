local opt = vim.opt

-- 들여쓰기 설정
opt.tabstop = 4      -- 탭 문자를 n칸으로 보여줌
opt.shiftwidth = 4   -- 자동 들여쓰기나 >>, << 시 n칸 이동
opt.softtabstop = 4  -- 탭 키 누를 때 n칸 이동
opt.expandtab = true -- tab을 space로 쓰나 tab 문자로 쓰나

-- UI 설정
opt.number = true    -- 줄 번호 표시
-- opt.relativenumber = true -- 상대 번호 (이동 편리)
opt.cursorline = true -- 현재 행 하이라이트
opt.hlsearch = true  -- 검색 결과 하이라이트

-- 구문 강조 및 파일 형식 설정
-- Neovim은 'syntax on'과 'filetype' 설정이 기본으로 켜져 있어 생략 가능합니다.
vim.cmd('colorscheme desert') -- 컬러 스킴 설정

-- Whitespace 시각화 설정 활성화
-- 기본값을 whitespace 시각화로 설정하면 에디터로 읽기 어려워서 선택적으로 사용
-- opt.list = true
-- :set list / :set nolist

-- listchars 옵션 설정
opt.listchars = {
  tab = '» ',       -- 탭을 '»'로 표시하고 그 뒤는 공백으로 채움
  space = '·',      -- 일반 공백을 '·' (가운데 점)으로 표시
  trail = '~',      -- 줄 끝의 trailing whitespace를 '~'로 표시
  extends = '>',    -- 줄이 화면 너비를 넘어갈 때 표시
  precedes = '<',   -- 줄이 화면 왼쪽 시작점을 넘어갈 때 표시
  eol = '↵',        -- 줄 끝에 '↵' 기호 표시 (선택 사항)
}

vim.lsp.enable('gopls')

