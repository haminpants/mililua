export type TokenType =
    | "KEYWORD"
    | "IDENTIFIER"
    | "NUMBER"
    | "STRING"
    | "EOF"

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
    identifierHead: /[a-zA-Z_]/,
    identifierBody: /[a-zA-Z0-9_]/,
    numberHead: /[0-9]/,
    numberBody: /[0-9\.]/,
    doubleQuote: /\"/,
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
            if (REGEX.numberHead.test(char)) {
                let number = ""
                let isFloat = false
                const _index = this.cursor

                while (!this.isAtEnd() && REGEX.numberBody.test(this.peek())) {
                    if (this.peek() == ".") {
                        if (!isFloat) {
                            isFloat = true
                        }
                        else {
                            break
                        }
                    }
                    number += this.next()
                }

                tokens.push({
                    type: "NUMBER",
                    value: number,
                    index: _index,
                    length: this.cursor - _index
                })

                continue
            }

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

                continue
            }

            throw new Error(`Unexpected character: ${char} at position ${this.cursor}`)
        }

        tokens.push({
            type: "EOF",
            value: "",
            index: this.source.length,
            length: 0
        })
        return tokens
    }
}

const text = `local "Hello World" 1234134.12341234 0.1234`
const l = new Lexer(text)
console.log(text.length)
console.log(l.tokenize())