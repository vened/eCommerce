let Button = ReactBootstrap.Button;

class Post extends React.Component {
    render () {
        return (
            <div>
                <Button>sdcf</Button>
                <Offer/>
                <div>Title: {this.props.title}</div>
            </div>
        );
    }
}

Post.propTypes = {
    title: React.PropTypes.string
};
