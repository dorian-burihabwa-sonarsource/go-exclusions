package core

type message struct {
	content string
}

func newMessage(content string) *message {
	message := message{content: content}
	return &message
}
