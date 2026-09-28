export type TokenType =
    | "KEYWORD"
    | "IDENTIFIER"
    | "STRING"

export interface Token {
    type: TokenType
    value: string
    index: number
    length: number
}

export const KEYWORDS = new Set([
    `local`, `function`, `return`, `if`, `else`, `elseif`, `then`, `for`, `in`, `while`, `do`, `end`
])

export const REGEX = {
    whitespace: /\s/,
    doubleQuote: /\"/,
    identifierHead: /[a-zA-Z_]/,
    identifierBody: /[a-zA-Z0-9_]/
}

export class Lexer {
    private cursor: number = 0
    private source: string

    constructor(_source: string) {
        this.source = _source
    }

    private peek(): string {
        return this.source[this.cursor]
    }

    private next(): string {
        return this.source[this.cursor++]
    }

    isAtEnd(): boolean {
        return this.cursor >= this.source.length
    }

    tokenize(): Token[] {
        const tokens: Token[] = []

        while (!this.isAtEnd()) {
            const char = this.peek()
            if (REGEX.whitespace.test(char)) {
                this.cursor++
                continue
            }

            // Literals
            if (REGEX.doubleQuote.test(char)) {
                this.cursor++

                let literal = ""
                const _index = this.cursor

                while (!this.isAtEnd() && !REGEX.doubleQuote.test(this.peek())) {
                    literal += this.next()
                }

                tokens.push({
                    type: "STRING",
                    value: literal,
                    index: _index,
                    length: this.cursor - _index
                })

                this.cursor++
                continue
            }

            // Identifiers & Keywords
            if (REGEX.identifierHead.test(char)) {
                let identifier = ""
                const _index = this.cursor

                while (!this.isAtEnd() && REGEX.identifierBody.test(this.peek())) {
                    identifier += this.next()
                }

                let _type: TokenType = "IDENTIFIER"
                if (KEYWORDS.has(identifier)) { _type = "KEYWORD" }

                tokens.push({
                    type: _type,
                    value: identifier,
                    index: _index,
                    length: this.cursor - _index
                })
            }
        }

        return tokens
    }
}

const text = `local "Hello World"`
const l = new Lexer(text)
console.log(text.length)
console.log(l.tokenize())